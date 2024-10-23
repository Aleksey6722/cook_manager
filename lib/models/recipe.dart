import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/models/recipe_step.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  // final int? id;
  // final String title;
  // final String cookingTime;
  // final int numberOfPortions;
  // final Category category;
  // final String? description;
  // final String? proteins;
  // final String? fats;
  // final String? carbohydrates;
  // final String? calories;
  // final String? recipeUrl;
  // final List<Ingredient?> listOfIngredients;
  // final List<RecipeStep?> listOfSteps;
  // final bool isFavourite;

  const factory Recipe({
    int? id,
    required String title,
    required String cookingTime,
    required int numberOfPortions,
    required Category category,
    String? description,
    String? proteins,
    String? fats,
    String? carbohydrates,
    String? calories,
    String? recipeUrl,
    required List<Ingredient?> listOfIngredients,
    required List<RecipeStep?> listOfSteps,
    @Default(false) bool isFavourite,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
