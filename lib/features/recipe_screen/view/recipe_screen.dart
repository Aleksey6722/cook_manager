import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/main/bloc/recipes_list_cubit.dart';
import 'package:cook_manager/features/recipe_screen/bloc/recipe_cubit.dart';
import 'package:cook_manager/features/recipe_screen/view/view.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    // required this.recipe,
    required this.recipeId,
    this.isFromAllCategoryList = false,
    this.categoryIdFromListScreen,
  });

  // final Recipe recipe;
  final int recipeId;
  final bool isFromAllCategoryList;
  final int? categoryIdFromListScreen;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final RecipeCubit _recipeCubit = GetIt.instance<RecipeCubit>();
  final RecipesListCubit _recipeListCubit = GetIt.instance<RecipesListCubit>();

  @override
  void initState() {
    _recipeCubit.getRecipe(widget.recipeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        _recipeListCubit.updateRecipeListPage(
          widget.categoryIdFromListScreen,
          widget.isFromAllCategoryList,
        );
      },
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
                  child: Text('Ошибка чтения из базы данных'));
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
                  isFromAllCategoryList:  widget.isFromAllCategoryList,
                  listScreenCategoryId: widget.categoryIdFromListScreen,
                  recipe:
                      state.recipe
                          // .copyWith(isFavourite: _isFavourite ?? false),
                ));
              },
              icon: const Icon(
                Icons.edit,
                size: 28,
              )),
          const SizedBox(width: 10),
          Stack(children: [
            GestureDetector(
              onTap: () => _setFavourite(state.recipe),
              child: const Icon(
                Icons.bookmark_border_outlined,
                size: 32,
              ),
            ),
            Positioned(
              top: 3.5,
              left: 3.5,
              child: Visibility(
                // visible: _isFavourite!,
                visible: state.recipe.isFavourite,
                child: GestureDetector(
                  onTap: () => _setFavourite(state.recipe),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.red,
                    size: 25,
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
                            '${state.recipe.title}(${state.recipe.id})',
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
                        const SizedBox(height: 10),
                        Text(state.recipe.description ?? ''),
                        const SizedBox(height: 10),
                        Row(children: [
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
                                  ?.copyWith(color: theme.primaryColor),
                            ),
                          ),
                        ]),
                        TabWidget(
                          steps: state.recipe.listOfSteps,
                          ingredients: state.recipe.listOfIngredients,
                        ),
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

  void _setFavourite(Recipe recipe) async {
    await _recipeCubit.switchFavourite(recipe);
    _recipeCubit.getRecipe(recipe.id!);
  }
}
