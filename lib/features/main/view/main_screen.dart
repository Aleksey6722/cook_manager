import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/main/bloc/category_bloc.dart';
import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'main_menu_container.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CategoryBloc _categoryBloc = GetIt.instance<CategoryBloc>();

  @override
  void initState() {
    _categoryBloc.add(GetCategoriesEvent());
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: BlocBuilder<CategoryBloc, CategoryState>(
              bloc: _categoryBloc,
              builder: (context, CategoryState state) {
                switch (state) {
                  case CategoryStateLoading():
                    return const SizedBox();
                  case CategoryStateLoaded():
                    return _buildPage(state);
                }
              }),
        ),
      ),
    );
  }

  _buildPage(CategoryStateLoaded state) {
    List<Category> list = state.listOfCategories.toList();
    list.insert(
        0,
        const Category(
            imageUrl: 'assets/images/all_categories.jpg', name: 'Все рецепты'));
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: list.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.router.push(RecipesListRoute(
            categoryId: list[index].id,
            categoryName: list[index].name,
          ));
        },
        child: MainMenuContainer(
            imageUrl: list[index].imageUrl, label: list[index].name),
      ),
    );
  }
}
