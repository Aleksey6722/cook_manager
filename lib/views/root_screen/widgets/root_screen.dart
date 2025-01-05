import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cook_manager/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: [
        const MainRoute(),
        const SearchRoute(),
        EditRoute(),
        const FavouritesRoute(),
        SettingsRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.colorScheme.primary,
            unselectedItemColor: theme.colorScheme.secondary.withOpacity(0.3),
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: S.of(context).main,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search_rounded),
                label: S.of(context).search,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.add_circle, size: 40),
                label: S.of(context).add,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.bookmark_border),
                label: S.of(context).favourite,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: S.of(context).settings,
              ),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    if(index == 0) {
      tabsRouter.navigate(const MainRoute());
    }
    tabsRouter.setActiveIndex(index);
  }
}
