import 'dart:io';
import 'package:cook_manager/features/main/bloc/category_bloc.dart';
import 'package:cook_manager/features/main/bloc/recipes_list_cubit.dart';
import 'package:cook_manager/features/recipe_screen/bloc/recipe_cubit.dart';
import 'package:cook_manager/features/recipe_screen/recipe_screen.dart';
import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RecipeTile extends StatelessWidget {
  RecipeTile({
    super.key,
    required this.recipe,
    this.isFromAllCategoryList = false,
    this.categoryIdFromListScreen,
    required this.onDelete,
  });

  final Recipe recipe;
  final bool isFromAllCategoryList;
  final int? categoryIdFromListScreen;
  final VoidCallback? onDelete;

  final RecipeCubit _recipeCubit = GetIt.instance<RecipeCubit>();
  final CategoryBloc _categoryBloc = GetIt.instance<CategoryBloc>();
  final RecipesListCubit _recipesListCubit = GetIt.instance<RecipesListCubit>();

  @override
  Widget build(BuildContext context) => buildItem(context);

  Widget buildItem(BuildContext context) {
    bool isFavourite = recipe.isFavourite;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: recipe.imageUrl == null
                      ? const AssetImage('assets/images/image_placeholder.jpg')
                      : FileImage(File(recipe.imageUrl!))),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: theme.colorScheme.primary.withOpacity(0.6),
              ),
              child: Center(
                child: Text(
                  _getCategoryName(recipe.category),
                  style: theme.textTheme.headlineSmall!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 60,
            child: GestureDetector(
              onTap: () => _setFavourite(),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: theme.colorScheme.primary.withOpacity(0.6),
                ),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: theme.colorScheme.onPrimary,
                  size: 31,
                ),
              ),
            ),
          ),
          Positioned(
            top: 17,
            right: 67.5,
            child: Visibility(
              visible: isFavourite,
              child: GestureDetector(
                onTap: () => _setFavourite(),
                child: const Icon(
                  Icons.bookmark,
                  color: Color(0xFFd14141),
                  size: 23,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => _deleteRecipe(context),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: theme.colorScheme.primary.withOpacity(0.6),
                ),
                child: Icon(
                  Icons.delete,
                  color: theme.colorScheme.onPrimary,
                  size: 31,
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Subtitle(
          cookingTime: recipe.cookingTime,
          numberOfPortions: recipe.numberOfPortions,
        ),
        Text(
          recipe.title,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }

  void _setFavourite() {
    _recipeCubit.switchFavourite(recipe);
    _recipesListCubit.updateRecipeListPage(
        categoryIdFromListScreen, isFromAllCategoryList);
  }

  _deleteRecipe(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(),
          title: const Text('Удаление рецепта'),
          content: const Text('Вы уверене что хотите удалить рецепт?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onDelete!();
                  _recipeCubit.deleteRecipe(recipe.id!);
                },
                child: const Text('Удалить')),
          ],
        );
      },
    );
  }

  String _getCategoryName(int id) {
    final List<Category> categories =
        (_categoryBloc.state as CategoryStateLoaded).listOfCategories;
    String name = '';
    for (Category e in categories) {
      if (e.id == id) {
        name = e.name;
        break;
      }
    }
    return name;
  }
}
