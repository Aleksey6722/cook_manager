import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../bloc/recipe_bloc.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    final RecipeBloc _recipeBloc = GetIt.instance<RecipeBloc>();
    final RecipeStateLoaded state = _recipeBloc.state as RecipeStateLoaded;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorWeight: 4,
            tabs: [
              Tab(
                text: 'Ингредиенты',
              ),
              Tab(
                text: 'Рецепт',
              )
            ],
          ),
          SizedBox(
            height: 500,
            child: TabBarView(children: [
              ListView.builder(
                // separatorBuilder: (context, index) => SizedBox(height: 8,),
                itemCount: state.recipe.listOfIngredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:
                        Text(state.recipe.listOfIngredients[index]?.name ?? ''),
                  );
                },
              ),
              ListView.builder(
                // separatorBuilder: (context, index) => SizedBox(height: 8,),
                itemCount: state.recipe.listOfSteps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:
                        Text(state.recipe.listOfSteps[index]?.stepText ?? ''),
                  );
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
