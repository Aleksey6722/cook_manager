import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/models/recipe_step.dart';
import 'package:flutter/material.dart';


class TabWidget extends StatefulWidget {
  const TabWidget({super.key, required this.steps, required this.ingredients});

  final List<RecipeStep> steps;
  final List<Ingredient> ingredients;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
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
                itemCount: widget.ingredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:
                        Text(widget.ingredients[index].name ?? ''),
                  );
                },
              ),
              ListView.builder(
                // separatorBuilder: (context, index) => SizedBox(height: 8,),
                itemCount: widget.steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:
                        Text(widget.steps[index].stepText ?? ''),
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
