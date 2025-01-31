import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/domain/favourite/favourite_list_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';

import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../home_screen/widgets/widgets.dart';

@RoutePage()
class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final FavouriteListCubit _favouriteListCubit =
      GetIt.instance<FavouriteListCubit>();
  late GlobalKey<AnimatedListState> listKey;

  @override
  void initState() {
    _favouriteListCubit.getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favourite),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          await _favouriteListCubit.getRecipes(emitInitState: false);
        },
        child: BlocBuilder<FavouriteListCubit, FavouriteListState>(
          bloc: _favouriteListCubit,
          builder: (BuildContext context, FavouriteListState state) {
            switch (state) {
              case FavouriteListInitial():
                return const SizedBox();
              case FavouriteListLoaded():
                return state.listOfRecipes.isEmpty
                    ? _buildEmptyPage()
                    : _buildPage(state);
            }
          },
        ),
      ),
    );
  }

  Widget _buildPage(FavouriteListLoaded state) {
    listKey = GlobalKey<AnimatedListState>();
    return AnimatedList.separated(
      key: listKey,
      padding: const EdgeInsets.all(20),
      initialItemCount: state.listOfRecipes.length,
      separatorBuilder: (context, index, animation) =>
          const SizedBox(height: 15),
      removedSeparatorBuilder: (context, index, animation) =>
          const SizedBox(height: 15),
      itemBuilder: (context, index, animation) {
        return GestureDetector(
          onTap: () => context.router.push(
            RecipeRoute(
              recipeId: state.listOfRecipes[index].rowid!,
            ),
          ),
          child: RecipeTile(
            isFromFavouriteScreen: true,
            recipe: state.listOfRecipes[index],
            onDelete: () => removeItem(state.listOfRecipes[index], index),
          ),
        );
      },
    );
  }

  void removeItem(Recipe recipe, index) {
    listKey.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: RecipeTile(
                recipe: recipe,
                onDelete: () {},
              ),
            ));
  }

  Widget _buildEmptyPage() {
    final theme = Theme.of(context);
    return ListView.builder(
      // List builder is for RefreshIndicator
      itemCount: 1,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              S.of(context).favourite_empty_message,
              style: theme.textTheme.bodyLarge,
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
                textStyle: theme.textTheme.bodyLarge,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: Text(S.of(context).create_recipe),
            )
          ],
        ),
      ),
    );
  }
}
