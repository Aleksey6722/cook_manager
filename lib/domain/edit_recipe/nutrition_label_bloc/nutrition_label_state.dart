part of '../../../../domain/edit_recipe/nutrition_label_bloc/nutrition_label_bloc.dart';

sealed class NutritionLabelState extends Equatable {
  final bool _isLabelFocused = false;
  final bool _isProteinsLabelFocused = false;
  final bool _isFatsLabelFocused = false;
  final bool _isCarbsLabelFocused = false;
  final bool _isCallorLabelFocused = false;

  @override
  List<Object?> get props => [];

  bool get isLabelFocused => _isLabelFocused;

  bool get isProteinsLabelFocused => _isProteinsLabelFocused;

  bool get isFatsLabelFocused => _isFatsLabelFocused;

  bool get isCarbsLabelFocused => _isCarbsLabelFocused;

  bool get isCallorLabelFocused => _isCallorLabelFocused;
}

final class NutritionLabelColor extends NutritionLabelState {
  @override
  final bool isLabelFocused;
  @override
  final bool isProteinsLabelFocused;
  @override
  final bool isFatsLabelFocused;
  @override
  final bool isCarbsLabelFocused;
  @override
  final bool isCallorLabelFocused;

  NutritionLabelColor({
    this.isProteinsLabelFocused = false,
    this.isFatsLabelFocused = false,
    this.isCarbsLabelFocused = false,
    this.isCallorLabelFocused = false,
    this.isLabelFocused = false,
  });

  @override
  List<Object?> get props => [
        isLabelFocused,
        isProteinsLabelFocused,
        isCallorLabelFocused,
        isFatsLabelFocused,
        isCarbsLabelFocused,
      ];
}
