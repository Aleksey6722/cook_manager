part of 'nutrition_label_bloc.dart';

sealed class NutritionLabelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NutritionLabelEventFocusedChanged extends NutritionLabelEvent {
  final FocusNode focus1;
  final FocusNode focus2;
  final FocusNode focus3;
  final FocusNode focus4;

  NutritionLabelEventFocusedChanged({
    required this.focus1,
    required this.focus2,
    required this.focus3,
    required this.focus4,
  });
}
