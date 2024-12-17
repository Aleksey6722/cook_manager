import 'package:auto_route/auto_route.dart';
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
        const SettingsRoute()
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, size: 40),
                label: 'Добавить',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: 'Избранное',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Настройки',
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
