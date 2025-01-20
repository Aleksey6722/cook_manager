import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/domain/favourite/favourite_list_cubit.dart';
import 'package:cook_manager/domain/home_screen/recipes_list_cubit.dart';
import 'package:cook_manager/domain/recipes/recipe_cubit.dart';
import 'package:cook_manager/domain/search/search_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';
import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/models/recipe_step.dart';

import 'package:cook_manager/views/recipe_screen/widgets/widgets.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_screen/widgets/widgets.dart';

@RoutePage()
class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    required this.recipeId,
    this.categoryIdFromListScreen,
    this.isFromAllCategoryScreen = false,
    this.isFromSearchScreen = false,
  });

  final int recipeId;
  final int? categoryIdFromListScreen;
  final bool isFromAllCategoryScreen;

  final bool isFromSearchScreen;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final RecipeCubit _recipeCubit = GetIt.instance<RecipeCubit>();
  final SearchCubit _searchCubit = GetIt.instance<SearchCubit>();
  final RecipesListCubit _recipeListCubit = GetIt.instance<RecipesListCubit>();
  final FavouriteListCubit _favouriteListCubit =
      GetIt.instance<FavouriteListCubit>();

  @override
  void initState() {
    _recipeCubit.getRecipe(widget.recipeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _refreshPages(),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        bloc: _recipeCubit,
        builder: (context, state) {
          switch (state) {
            case RecipeStateLoading():
              return const Scaffold();
            case RecipeStateLoaded():
              return _buildPage(state);
            case RecipeStateError():
              return const SafeArea(
                  child: Scaffold(body: Text('Error reading from database')));
          }
        },
      ),
    );
  }

  Widget _buildPage(RecipeStateLoaded state) {
    final String? imageUrl = state.recipe.imageUrl;
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
        leading: const BackButton(
          style: ButtonStyle(iconSize: WidgetStatePropertyAll(26)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.router.push(EditRoute(
                    isFromAllCategoryList: widget.isFromAllCategoryScreen,
                    listScreenCategoryId: widget.categoryIdFromListScreen,
                    recipe: state.recipe));
              },
              icon: const Icon(
                Icons.edit,
                size: 24,
              )),
          const SizedBox(width: 10),
          Stack(children: [
            GestureDetector(
              onTap: () => _setFavourite(state.recipe),
              child: const Icon(
                Icons.bookmark_border_outlined,
                size: 28,
              ),
            ),
            Positioned(
              top: 2.5,
              left: 3,
              child: Visibility(
                visible: state.recipe.isFavourite,
                child: GestureDetector(
                  onTap: () => _setFavourite(state.recipe),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.red,
                    size: 22,
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 2 * screenWidth / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageUrl != null
                        ? FileImage(File(state.recipe.imageUrl!))
                        : const AssetImage(
                            'assets/images/image_placeholder.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: (2 * screenWidth / 3) - 20,
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            state.recipe.title,
                            style: theme.textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Subtitle(
                            cookingTime: state.recipe.cookingTime,
                            numberOfPortions: state.recipe.numberOfPortions),
                        const SizedBox(height: 10),
                        NutritionBanner(recipe: state.recipe),
                        if (state.recipe.description != '') ...[
                          const SizedBox(height: 10),
                          Text(state.recipe.description ?? '')
                        ],
                        if (state.recipe.recipeUrl != '') ...[
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              final url = state.recipe.recipeUrl ?? "";
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              }
                            },
                            child: Text(
                              state.recipe.recipeUrl ?? "",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: theme.colorScheme.primary),
                            ),
                          ),
                        ],
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).ingredients,
                          style: theme.textTheme.headlineSmall,
                        ),
                        _ingredientsSection(state.recipe.listOfIngredients),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).method,
                          style: theme.textTheme.headlineSmall,
                        ),
                        _methodSection(state.recipe.listOfSteps),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _ingredientsSection(List<Ingredient> ingredients) {
    final theme = Theme.of(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => DottedLine(
        dashColor: theme.colorScheme.onSurface,
      ),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ingredients[index].name ?? ''),
              Text(ingredients[index].value ?? ''),
            ],
          ),
        );
      },
    );
  }

  Widget _methodSection(List<RecipeStep> steps) {
    final theme = Theme.of(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => DottedLine(
        dashColor: theme.colorScheme.onSurface,
      ),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text.rich(
                  TextSpan(
                    text: S.of(context).recipe_step_number(index + 1),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: steps[index].stepText ?? '',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _setFavourite(Recipe recipe) async {
    await _recipeCubit.switchFavourite(recipe.rowid!);
    _recipeCubit.getRecipe(recipe.rowid!);
    _favouriteListCubit.getRecipes();
  }

  void _refreshPages() {
    _favouriteListCubit.getRecipes();
    _searchCubit.refreshPage();
    _recipeListCubit.emitInitState();
    _recipeListCubit.updateRecipeListPage(
      widget.categoryIdFromListScreen,
      widget.isFromAllCategoryScreen,
    );
  }
}
