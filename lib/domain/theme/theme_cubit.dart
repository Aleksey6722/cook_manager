import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(brightness: Brightness.light));

  void setTheme(Brightness brightness) {
    emit(ThemeState(brightness: brightness));
  }
}
