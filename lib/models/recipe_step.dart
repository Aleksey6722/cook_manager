import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_step.freezed.dart';
part 'recipe_step.g.dart';

@freezed
class RecipeStep with _$RecipeStep{
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory RecipeStep({String? stepText}) = _RecipeStep;

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);
}
