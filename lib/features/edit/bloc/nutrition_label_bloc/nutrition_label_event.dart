part of 'nutrition_label_bloc.dart';

sealed class NutritionLabelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NutritionLabelEventFocusedChanged extends NutritionLabelEvent {
  final FocusNode callories;
  final FocusNode carbones;
  final FocusNode fats;
  final FocusNode proteins;

  NutritionLabelEventFocusedChanged({
    required this.callories,
    required this.carbones,
    required this.fats,
    required this.proteins,
  });
}
