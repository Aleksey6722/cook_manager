import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cook_manager/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<bool> _backPressAllowed = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: _backPressAllowed,
      builder: (BuildContext context, bool backPressAllowed, Widget? child) =>
          PopScope(
        canPop: backPressAllowed,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            _allowBackPress();
            ScaffoldMessenger.of(context).showSnackBar(_showSnackBar(context));
          }
        },
        child: AutoTabsRouter(
          routes: [
            const MainRoute(),
            const SearchRoute(),
            EditRoute(),
            const FavouritesRoute(),
            const SettingsRoute()
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return PopScope(
                    child: Scaffold(
                      body: child,
                      bottomNavigationBar: BottomNavigationBar(
                        selectedItemColor: theme.colorScheme.primary,
                        unselectedItemColor:
                            theme.colorScheme.secondary.withOpacity(0.3),
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
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  Future<void> _allowBackPress() async {
    _backPressAllowed.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    _backPressAllowed.value = false;
  }

  SnackBar _showSnackBar(BuildContext context) {
    return SnackBar(
      content: Text(S.of(context).double_tap_to_exit_message),
      duration: const Duration(milliseconds: 2000),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      )),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    if (index == 0) {
      tabsRouter.navigate(const MainRoute());
    }
    tabsRouter.setActiveIndex(index);
  }
}
