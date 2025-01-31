import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/domain/search/search_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';
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
  Timer? _debounce;

  @override
  void dispose() {
    _textController.dispose();
    _debounce?.cancel();
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  onFieldSubmitted: (val) => _searchCubit.searchRecipes(val),
                  controller: _textController,
                  onChanged: _search,
                  decoration: InputDecoration(
                    hintText: S.of(context).search_of_recipes,
                    border: InputBorder.none,
                    icon: const Icon(
                      Icons.search,
                      size: 26,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _textController.clear();
                        setState(() {});
                      },
                      child: Visibility(
                          visible: _textController.text.isNotEmpty,
                          child: const Icon(Icons.close)),
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
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(S.of(context).search_no_result),
                    ),
                  );
                case SearchInitState():
                  return const SliverToBoxAdapter(
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

  void _search(String val) async {
      setState(() {});
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(
        const Duration(milliseconds: 500),
            () => _searchCubit.searchRecipes(val),
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
