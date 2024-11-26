// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [EditScreen]
class EditRoute extends PageRouteInfo<EditRouteArgs> {
  EditRoute({
    Key? key,
    Recipe? recipe,
    List<PageRouteInfo>? children,
  }) : super(
          EditRoute.name,
          args: EditRouteArgs(
            key: key,
            recipe: recipe,
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
      );
    },
  );
}

class EditRouteArgs {
  const EditRouteArgs({
    this.key,
    this.recipe,
  });

  final Key? key;

  final Recipe? recipe;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, recipe: $recipe}';
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
    List<PageRouteInfo>? children,
  }) : super(
          RecipeRoute.name,
          args: RecipeRouteArgs(
            key: key,
            recipeId: recipeId,
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
      );
    },
  );
}

class RecipeRouteArgs {
  const RecipeRouteArgs({
    this.key,
    required this.recipeId,
  });

  final Key? key;

  final int recipeId;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipeId: $recipeId}';
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
