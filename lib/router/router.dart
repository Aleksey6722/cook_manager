import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/views/edit_screen/edit_screen.dart';
import 'package:cook_manager/views/favourites_screen/widgets/favourites_screen.dart';

import 'package:flutter/material.dart';

import '../views/home_screen/widgets/widgets.dart';
import '../views/recipe_screen/widgets/widgets.dart';
import '../views/root_screen/widgets/widgets.dart';
import '../views/search_screen/widgets/widgets.dart';
import '../views/settings_screen/widgets/widgets.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: CategoryNavigationRoute.page,
              children: [
                AutoRoute(page: MainRoute.page, initial: true),
                AutoRoute(page: RecipesListRoute.page, path: 'recipes'),
              ],
            ),
            AutoRoute(
              page: SearchRoute.page,
              path: 'search',
            ),
            AutoRoute(
              page: EditRoute.page,
              path: 'add',
            ),
            AutoRoute(
              page: FavouritesRoute.page,
              path: 'favourites',
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),
          ],
        ),
        AutoRoute(page: RecipeRoute.page, path: '/recipe'),
        AutoRoute(page: EditRoute.page, path: '/edit'),
      ];
}
