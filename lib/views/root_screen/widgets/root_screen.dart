import 'package:auto_route/auto_route.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
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
            return PopScope(
              child: Scaffold(
                body: child,
                bottomNavigationBar: BottomBarCreative(
                  indexSelected: tabsRouter.activeIndex,
                  onTap: (index) => _openPage(index, tabsRouter),
                  items: [
                    TabItem(
                      icon: Icons.home,
                      title: S.of(context).main,
                    ),
                    TabItem(
                      icon: Icons.search_rounded,
                      title: S.of(context).search,
                    ),
                    TabItem(
                      icon: Icons.add,
                      title: S.of(context).add,
                    ),
                    TabItem(
                      icon: Icons.bookmark_border,
                      title: S.of(context).favourite,
                    ),
                    TabItem(
                      icon: Icons.settings,
                      title: S.of(context).settings,
                    ),
                  ],
                  backgroundColor: theme.colorScheme.surfaceContainer,
                  color: theme.colorScheme.onSurface,
                  colorSelected: theme.colorScheme.primary,
                ),
              ),
            );
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
