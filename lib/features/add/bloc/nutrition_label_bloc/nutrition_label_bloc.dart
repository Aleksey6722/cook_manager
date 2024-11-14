import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'nutrition_label_event.dart';

part 'nutrition_label_state.dart';

@singleton
class NutritionLabelBloc
    extends Bloc<NutritionLabelEvent, NutritionLabelState> {
  NutritionLabelBloc() : super(NutritionLabelColor(isLabelFocused: false)) {
    on<NutritionLabelEventFocusedChanged>((event, emit) {
      if (event.callories.hasFocus ||
          event.carbones.hasFocus ||
          event.fats.hasFocus ||
          event.proteins.hasFocus) {
        if (event.callories.hasFocus) {
          emit(NutritionLabelColor(
              isLabelFocused: true, isCallorLabelFocused: true));
        }
        if (event.carbones.hasFocus) {
          emit(NutritionLabelColor(
              isLabelFocused: true, isCarbsLabelFocused: true));
        }
        if (event.fats.hasFocus) {
          emit(NutritionLabelColor(
              isLabelFocused: true, isFatsLabelFocused: true));
        }
        if (event.proteins.hasFocus) {
          emit(NutritionLabelColor(
              isLabelFocused: true, isProteinsLabelFocused: true));
        }
      } else {
        emit(NutritionLabelColor(isLabelFocused: false));
      }
    });
  }
}
