// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CategoryNavigationScreen]
class CategoryNavigationRoute extends PageRouteInfo<void> {
  const CategoryNavigationRoute({List<PageRouteInfo>? children})
      : super(
          CategoryNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoryNavigationScreen();
    },
  );
}

/// generated route for
/// [EditScreen]
class EditRoute extends PageRouteInfo<EditRouteArgs> {
  EditRoute({
    Key? key,
    Recipe? recipe,
    int? listScreenCategoryId,
    bool isFromAllCategoryList = false,
    bool isFromSearchScreen = false,
    List<PageRouteInfo>? children,
  }) : super(
          EditRoute.name,
          args: EditRouteArgs(
            key: key,
            recipe: recipe,
            listScreenCategoryId: listScreenCategoryId,
            isFromAllCategoryList: isFromAllCategoryList,
            isFromSearchScreen: isFromSearchScreen,
          ),
          initialChildren: children,
        );

  static const String name = 'EditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<EditRouteArgs>(orElse: () => const EditRouteArgs());
      return EditScreen(
        key: args.key,
        recipe: args.recipe,
        listScreenCategoryId: args.listScreenCategoryId,
        isFromAllCategoryList: args.isFromAllCategoryList,
        isFromSearchScreen: args.isFromSearchScreen,
      );
    },
  );
}

class EditRouteArgs {
  const EditRouteArgs({
    this.key,
    this.recipe,
    this.listScreenCategoryId,
    this.isFromAllCategoryList = false,
    this.isFromSearchScreen = false,
  });

  final Key? key;

  final Recipe? recipe;

  final int? listScreenCategoryId;

  final bool isFromAllCategoryList;

  final bool isFromSearchScreen;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, recipe: $recipe, listScreenCategoryId: $listScreenCategoryId, isFromAllCategoryList: $isFromAllCategoryList, isFromSearchScreen: $isFromSearchScreen}';
  }
}

/// generated route for
/// [FavouritesScreen]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute({List<PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavouritesScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [RecipeScreen]
class RecipeRoute extends PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({
    Key? key,
    required int recipeId,
    int? categoryIdFromListScreen,
    bool isFromAllCategoryScreen = false,
    bool isFromSearchScreen = false,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeRoute.name,
          args: RecipeRouteArgs(
            key: key,
            recipeId: recipeId,
            categoryIdFromListScreen: categoryIdFromListScreen,
            isFromAllCategoryScreen: isFromAllCategoryScreen,
            isFromSearchScreen: isFromSearchScreen,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeRouteArgs>();
      return RecipeScreen(
        key: args.key,
        recipeId: args.recipeId,
        categoryIdFromListScreen: args.categoryIdFromListScreen,
        isFromAllCategoryScreen: args.isFromAllCategoryScreen,
        isFromSearchScreen: args.isFromSearchScreen,
      );
    },
  );
}

class RecipeRouteArgs {
  const RecipeRouteArgs({
    this.key,
    required this.recipeId,
    this.categoryIdFromListScreen,
    this.isFromAllCategoryScreen = false,
    this.isFromSearchScreen = false,
  });

  final Key? key;

  final int recipeId;

  final int? categoryIdFromListScreen;

  final bool isFromAllCategoryScreen;

  final bool isFromSearchScreen;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipeId: $recipeId, categoryIdFromListScreen: $categoryIdFromListScreen, isFromAllCategoryScreen: $isFromAllCategoryScreen, isFromSearchScreen: $isFromSearchScreen}';
  }
}

/// generated route for
/// [RecipesListScreen]
class RecipesListRoute extends PageRouteInfo<RecipesListRouteArgs> {
  RecipesListRoute({
    Key? key,
    required int? categoryId,
    required String categoryName,
    List<PageRouteInfo>? children,
  }) : super(
          RecipesListRoute.name,
          args: RecipesListRouteArgs(
            key: key,
            categoryId: categoryId,
            categoryName: categoryName,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipesListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipesListRouteArgs>();
      return RecipesListScreen(
        key: args.key,
        categoryId: args.categoryId,
        categoryName: args.categoryName,
      );
    },
  );
}

class RecipesListRouteArgs {
  const RecipesListRouteArgs({
    this.key,
    required this.categoryId,
    required this.categoryName,
  });

  final Key? key;

  final int? categoryId;

  final String categoryName;

  @override
  String toString() {
    return 'RecipesListRouteArgs{key: $key, categoryId: $categoryId, categoryName: $categoryName}';
  }
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
