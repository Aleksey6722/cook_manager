import 'dart:io';
import 'package:cook_manager/features/main/bloc/category_bloc.dart';
import 'package:cook_manager/features/recipe_screen/bloc/recipe_cubit.dart';
import 'package:cook_manager/features/recipe_screen/recipe_screen.dart';
import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RecipeTile extends StatefulWidget {
  const RecipeTile({
    super.key,
    required this.recipe,
    this.isFromAllCategoryList = false,
    this.categoryIdFromListScreen,
  });

  final Recipe recipe;
  final bool isFromAllCategoryList;
  final int? categoryIdFromListScreen;

  @override
  State<RecipeTile> createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  final RecipeCubit _recipeCubit = GetIt.instance<RecipeCubit>();

  @override
  Widget build(BuildContext context) {
    bool isFavourite = widget.recipe.isFavourite;
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
                  image: widget.recipe.imageUrl == null
                      ? const AssetImage('assets/images/image_placeholder.jpg')
                      : FileImage(File(widget.recipe.imageUrl!))),
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
                  _getCategoryName(widget.recipe.category),
                  style: theme.textTheme.headlineSmall!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
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
            top: 15.6,
            right: 16,
            child: Visibility(
              visible: isFavourite,
              child: GestureDetector(
                onTap: () => _setFavourite(),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.red,
                  size: 25,
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Subtitle(
          cookingTime: widget.recipe.cookingTime,
          numberOfPortions: widget.recipe.numberOfPortions,
        ),
        Text(
          widget.recipe.title,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }

  void _setFavourite() {
    _recipeCubit.switchFavourite(widget.recipe);
    _recipeCubit.updateRecipeListPage(
        widget.categoryIdFromListScreen, widget.isFromAllCategoryList);
  }

  String _getCategoryName(int id) {
    final CategoryBloc _categoryBloc = GetIt.instance<CategoryBloc>();
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
