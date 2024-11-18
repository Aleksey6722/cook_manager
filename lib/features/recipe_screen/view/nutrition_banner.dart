import 'package:cook_manager/features/recipe_screen/bloc/recipe_bloc.dart';
import 'package:flutter/material.dart';

class NutritionBanner extends StatelessWidget {
  const NutritionBanner({super.key, required this.state});

  final RecipeStateLoaded state;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Белки: ${state.recipe.proteins}'),
          Text('Жиры: ${state.recipe.fats}'),
          Text('Углеводы: ${state.recipe.carbohydrates}'),
          Text('Калории: ${state.recipe.calories}'),
        ],
      ),
    ]);
  }
}
