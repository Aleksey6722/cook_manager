import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/ingredient.dart';

import 'package:cook_manager/utils/recipe_step.dart';

class Recipe {
  final int? id;
  final String title;
  final String cookingTime;
  final int numberOfPortions;
  final Category category;
  final String? description;
  final String? proteins;
  final String? fats;
  final String? carbohydrates;
  final String? calories;
  final String? recipeUrl;
  final List<Ingredient?> listOfIngredients;
  final List<RecipeStep?> listOfSteps;
  final bool isFavourite;

  Recipe({
    this.id,
    required this.title,
    required this.cookingTime,
    required this.numberOfPortions,
    required this.category,
    this.description,
    this.proteins,
    this.fats,
    this.carbohydrates,
    this.calories,
    this.recipeUrl,
    required this.listOfIngredients,
    required this.listOfSteps,
    this.isFavourite = false,
  });
}
