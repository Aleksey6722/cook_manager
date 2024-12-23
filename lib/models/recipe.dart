import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/models/recipe_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Recipe({
    int? rowid,
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
    required List<Ingredient> listOfIngredients,
    required List<RecipeStep> listOfSteps,
    @Default(false) bool isFavourite,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

}
