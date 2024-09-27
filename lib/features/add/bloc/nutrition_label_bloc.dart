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
      if (event.focus1.hasFocus ||
          event.focus2.hasFocus ||
          event.focus3.hasFocus ||
          event.focus4.hasFocus) {
        emit(NutritionLabelColor(isLabelFocused: true));
      } else {
        emit(NutritionLabelColor(isLabelFocused: false));
      }
    });
  }
}
