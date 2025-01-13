import 'dart:io';

import 'package:cook_manager/domain/favourite/favourite_list_cubit.dart';
import 'package:cook_manager/domain/home_screen/category_bloc.dart';
import 'package:cook_manager/domain/recipes/recipe_cubit.dart';
import 'package:cook_manager/domain/search/search_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';

import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/views/home_screen/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RecipeTile extends StatefulWidget {
  const RecipeTile({
    super.key,
    required this.recipe,
    this.isFromAllCategoryScreen = false,
    this.categoryIdFromListScreen,
    required this.onDelete,
    this.isFromFavouriteScreen = false,
    this.isFromSearchScreen = false,
  });

  final Recipe recipe;
  final bool isFromAllCategoryScreen;
  final bool isFromFavouriteScreen;
  final bool isFromSearchScreen;
  final int? categoryIdFromListScreen;
  final VoidCallback? onDelete;

  @override
  State<RecipeTile> createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  final RecipeCubit _recipeCubit = GetIt.instance<RecipeCubit>();
  final CategoryBloc _categoryBloc = GetIt.instance<CategoryBloc>();
  final FavouriteListCubit _favouriteListCubit =
      GetIt.instance<FavouriteListCubit>();
  final SearchCubit _searchCubit = GetIt.instance<SearchCubit>();

  late bool _isFavourite = widget.recipe.isFavourite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
            height: (MediaQuery.of(context).size.width - 40) / 1.9,
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
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 55,
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
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15.5,
            right: 61,
            child: Visibility(
              visible: _isFavourite,
              child: GestureDetector(
                onTap: () => _setFavourite(),
                child: const Icon(
                  Icons.bookmark,
                  color: Color(0xFFd14141),
                  size: 18,
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
                  size: 24,
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
          style: theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }

  void _setFavourite() async {
    await _recipeCubit.switchFavourite(widget.recipe.rowid!);
    _isFavourite = !_isFavourite;
    _searchCubit.refreshPage();
    if (!widget.isFromSearchScreen) {
      _searchCubit.refreshPage();
    }
    if (!widget.isFromFavouriteScreen) {
      _favouriteListCubit.getRecipes();
    }
    setState(() {});
  }

  _deleteRecipe(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(),
          title: Text(S.of(context).deleting_recipe),
          content: Text(S.of(context).deleting_recipe_message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(S.of(context).cansel),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _recipeCubit.deleteRecipe(widget.recipe.rowid!);
                  if (!widget.isFromSearchScreen) {
                    _searchCubit.refreshPage();
                  }
                  if (!widget.isFromFavouriteScreen) {
                    _favouriteListCubit.getRecipes();
                  }
                  widget.onDelete!();
                },
                child: Text(S.of(context).delete)),
          ],
        );
      },
    );
  }

  String _getCategoryName(int id) {
    final List<Category> categories =
        (_categoryBloc.state as CategoryStateLoaded).listOfCategories;
    final List<String> categorieNames = [
      S.of(context).salads,
      S.of(context).snacks,
      S.of(context).soups,
      S.of(context).main_course,
      S.of(context).desserts,
      S.of(context).drinks
    ];

    if(Localizations.localeOf(context).toString() == 'en') {
      String name = categorieNames[id-1];
      return name;
    }

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
