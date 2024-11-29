import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/main/bloc/recipes_list_cubit.dart';
import 'package:cook_manager/features/recipe_screen/view/recipe_tile.dart';
import 'package:cook_manager/router/router.dart';
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
      appBar: AppBar(
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
              return state.listOfRecipes.isEmpty
                  ? _buildEmptyPage(state)
                  : _buildPage(state);
          }
        },
      ),
    );
  }

  Widget _buildPage(RecipesListLoaded state) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () => _recipesListCubit.getRecipes(widget.categoryId),
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: state.listOfRecipes.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => context.router
                  .push(RecipeRoute(recipeId: state.listOfRecipes[index].id!)),
              child: RecipeTile(
                recipe: state.listOfRecipes[index],
              ));
        },
      ),
    );
  }

  Widget _buildEmptyPage(RecipesListLoaded state) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'У Вас нет ни одного рецепта в этой категории',
            style: theme.textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              context.router.navigate(EditRoute());
            },
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            child: const Text('Создать рецепт'),
          )
        ],
      ),
    );
  }
}
