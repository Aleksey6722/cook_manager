import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/domain/home_screen/recipes_list_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';

import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
import 'package:cook_manager/views/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class RecipesListScreen extends StatefulWidget {
  const RecipesListScreen(
      {super.key, required this.categoryId, required this.categoryName});

  final int? categoryId;
  final String categoryName;

  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  final RecipesListCubit _recipesListCubit = GetIt.instance<RecipesListCubit>();
  late GlobalKey<AnimatedListState> listKey;

  @override
  void initState() {
    _recipesListCubit.getRecipes(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
        leading: const BackButton(),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          _recipesListCubit.getRecipes(widget.categoryId);
        },
        child: BlocBuilder<RecipesListCubit, RecipesListState>(
          bloc: _recipesListCubit,
          builder: (BuildContext context, RecipesListState state) {
            switch (state) {
              case RecipesListInitial():
                return const Scaffold();
              case RecipesListLoaded():
                return state.listOfRecipes.isEmpty
                    ? _buildEmptyPage()
                    : _buildPage(state);
            }
          },
        ),
      ),
    );
  }

  Widget _buildPage(RecipesListLoaded state) {
    listKey = GlobalKey<AnimatedListState>();
    return AnimatedList.separated(
      key: listKey,
      padding: const EdgeInsets.all(20),
      initialItemCount: state.listOfRecipes.length,
      separatorBuilder: (context, index, animation) =>
          const SizedBox(height: 15),
      removedSeparatorBuilder: (context, index, animation) =>
          const SizedBox(height: 15),
      itemBuilder: (context, index, animation) {
        return GestureDetector(
          onTap: () => context.router.push(RecipeRoute(
            recipeId: state.listOfRecipes[index].rowid!,
            isFromAllCategoryScreen: widget.categoryId == null,
            categoryIdFromListScreen: widget.categoryId,
          )),
          child: RecipeTile(
            recipe: state.listOfRecipes[index],
            isFromAllCategoryScreen: widget.categoryId == null,
            categoryIdFromListScreen: widget.categoryId,
            onDelete: () => removeItem(state.listOfRecipes[index], index),
          ),
        );
      },
    );
  }

  void removeItem(Recipe recipe, index) {
    listKey.currentState!.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: RecipeTile(
          recipe: recipe,
          onDelete: () {},
        ),
      ),
    );
  }

  Widget _buildEmptyPage() {
    final theme = Theme.of(context);
    return ListView.builder(
      // List builder is for RefreshIndicator
      itemCount: 1,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              S.of(context).list_empty_message,
              style: theme.textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                context.router.navigate(EditRoute());
              },
              style: TextButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: Text(S.of(context).create_recipe),
            )
          ],
        ),
      ),
    );
  }
}
