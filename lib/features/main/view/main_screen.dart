import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/main/bloc/category_bloc.dart';
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
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: BlocProvider(
              create: (context) => _categoryBloc,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, CategoryState state) {
                switch (state) {
                  case CategoryStateLoading():
                    return const SizedBox();
                  case CategoryStateLoaded():
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => MainMenuContainer(
                          imageUrl: state.listOfCategories[index].imageUrl,
                          label: state.listOfCategories[index].name),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: state.listOfCategories.length,
                    );
                }
              }),
            ),
          ),
        )
      ]),
    );
  }
}
