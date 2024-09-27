import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/utils/categories.dart';
import 'package:flutter/material.dart';

import 'main_menu_container.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final categories = Categories();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => MainMenuContainer(
                  imageUrl: categories.items[index].imageUrl,
                  label: categories.items[index].name),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: categories.items.length,
            ),
          ),
        )
      ]),
    );
  }
}
