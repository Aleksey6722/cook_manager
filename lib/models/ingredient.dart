import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Ingredient({
    String? name,
    String? value,
  }) = _Ingredient;

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
