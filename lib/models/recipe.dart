import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/models/recipe_step.dart';
import 'package:flutter/foundation.dart';
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

    @Uint8ListConverter()
    Uint8List? imageBytes,

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

class Uint8ListConverter implements JsonConverter<Uint8List?, List<dynamic>?> {

  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<dynamic>? json) {
    if (json == null) return null;
    final list = json.map((element){ return element as int;}).toList();
    return Uint8List.fromList(list);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    if (object == null) return null;

    return object.toList();
  }
}
