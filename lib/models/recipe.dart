import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/models/list_of_ingredients.dart';
import 'package:cook_manager/models/recipe_step.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Recipe({
    int? id,
    required String title,
    required String cookingTime,
    required String numberOfPortions,
    required int category,
    String? description,
    String? imageUrl,
    String? proteins,
    String? fats,
    String? carbohydrates,
    String? calories,
    String? recipeUrl,
    required ListOfIngredients listOfIngredients,
    required List<RecipeStep?> listOfSteps,
    @Default(false) bool isFavourite,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

}

extension ExtList on List {
  List<dynamic> toJson() {
    return this.map((element) {
      return element.toJson();
    }).toList();
  }
}