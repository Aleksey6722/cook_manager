import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/domain/search/search_cubit.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../home_screen/widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final DataRepository repository = GetIt.instance<DataRepository>();
  final SearchCubit _searchCubit = GetIt.instance<SearchCubit>();
  final TextEditingController _textController = TextEditingController();
  late GlobalKey<SliverAnimatedListState> listKey;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          _searchCubit.searchRecipes(_textController.text);
        },
        child: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: theme.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            elevation: 5,
            shadowColor: theme.colorScheme.surface,
            // title: const Center(child: Text('Cook manager')),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Поиск рецептов...',
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          _searchCubit.searchRecipes(_textController.text),
                      child: const Icon(Icons.search),
                    ),
                    suffixIconConstraints: const BoxConstraints(maxHeight: 30),
                    contentPadding: const EdgeInsets.all(5),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            bloc: _searchCubit,
            builder: (BuildContext context, SearchState state) {
              switch (state) {
                case SearchEmptyState():
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('Поиск не дал результатов'),
                    ),
                  );
                case SearchInitState():
                  return const SliverToBoxAdapter(
                    // child: Center(
                    //   child: Text('Введите слова в строку поиска'),
                    // ),
                    child: SizedBox(),
                  );
                case SearchLoadedState():
                  listKey = GlobalKey<SliverAnimatedListState>();
                  return SliverAnimatedList(
                    key: listKey,
                    initialItemCount: state.listOfRecipes.length,
                    itemBuilder: (context, index, animation) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: GestureDetector(
                          onTap: () => context.router.push(
                            RecipeRoute(
                              recipeId: state.listOfRecipes[index].rowid!,
                            ),
                          ),
                          child: RecipeTile(
                            isFromSearchScreen: true,
                            recipe: state.listOfRecipes[index],
                            onDelete: () =>
                                removeItem(state.listOfRecipes[index], index),
                          ),
                        ),
                      );
                    },
                  );
              }
            },
          ),
        ]),
      ),
    );
  }

  void removeItem(Recipe recipe, index) {
    listKey.currentState!.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: RecipeTile(
            recipe: recipe,
            onDelete: () {},
          ),
        ),
      ),
    );
  }
}
