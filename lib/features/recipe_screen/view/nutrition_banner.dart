import 'package:cook_manager/models/recipe.dart';
import 'package:flutter/material.dart';

class NutritionBanner extends StatelessWidget {
  const NutritionBanner({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Белки: ${recipe.proteins}'),
          Text('Жиры: ${recipe.fats}'),
          Text('Углеводы: ${recipe.carbohydrates}'),
          Text('Калории: ${recipe.calories}'),
        ],
      ),
    ]);
  }
}
