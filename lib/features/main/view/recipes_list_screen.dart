import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/main/bloc/recipes_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class RecipesListScreen extends StatefulWidget {
  const RecipesListScreen(
      {super.key, required this.categoryId, required this.categoryName});

  final int? categoryId;
  final String categoryName;

  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  final RecipesListCubit _recipesListCubit = GetIt.instance<RecipesListCubit>();

  @override
  void initState() {
    _recipesListCubit.getRecipes(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar:  AppBar(
        title: Text(widget.categoryName),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
        leading: const BackButton(),
      ),
      body: BlocBuilder<RecipesListCubit, RecipesListState>(
        bloc: _recipesListCubit,
        builder: (BuildContext context, RecipesListState state) {
          switch (state) {
            case RecipesListInitial():
              return const SizedBox();
            case RecipesListLoaded():
              return _buildPage(state);
          }
        },
      ),
    );
  }

  Widget _buildPage(RecipesListLoaded state) {
    return const Scaffold(
      body: Placeholder(),
    );
  }
}
