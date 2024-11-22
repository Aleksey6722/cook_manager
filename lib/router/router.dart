import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:flutter/material.dart';

import '../features/edit/view/edit_screen.dart';
import '../features/favourites/view/favourites_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/main/view/main_screen.dart';
import '../features/recipe_screen/view/recipe_screen.dart';
import '../features/search/view/search_screen.dart';
import '../features/settings/view/settings_screen.dart';

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
              page: MainRoute.page,
              path: 'main',
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
