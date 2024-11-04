import 'package:cook_manager/models/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_of_ingredients.freezed.dart';
part 'list_of_ingredients.g.dart';

@freezed
class ListOfIngredients with _$ListOfIngredients {
  const factory ListOfIngredients({
   required List<Ingredient?> list,
  }) = _ListOfIngredients;

  factory ListOfIngredients.fromJson(Map<String, dynamic> json) => _$ListOfIngredientsFromJson(json);

}

