part of 'nutrition_label_bloc.dart';

sealed class  NutritionLabelState extends Equatable {
  final bool _isLabelFocused = false;
  @override
  List<Object?> get props => [];

  bool get isLabelFocused => _isLabelFocused;
}

final class  NutritionLabelColor extends NutritionLabelState {
  final bool isLabelFocused;
  NutritionLabelColor({required this.isLabelFocused});

  @override
  List<Object?> get props => [isLabelFocused];
}