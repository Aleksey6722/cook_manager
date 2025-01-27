import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/database/theme_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

part 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsCurrentState> {
  final DataRepository _dataRepository;
  final ThemeStorage _preferencesHelper = GetIt.instance<ThemeStorage>();

  SettingsCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(
          SettingsCurrentState(
              brightness: GetIt.instance<ThemeStorage>().initBrightness,
              locale:
                  Platform.localeName.substring(0, 2) == 'ru' ? 'ru' : 'en'),
        );

  void changeAmountOfRecipes() async {
    int amount = await _dataRepository.getAmountOfRecipes();
    emit(SettingsCurrentState(
      brightness: state.brightness,
      amountOfRecipes: amount,
      locale: state.locale,
    ));
  }

  void changeTheme(Brightness brightness) {
    _preferencesHelper.saveTheme(brightness.name);
    emit(SettingsCurrentState(
        amountOfRecipes: state.amountOfRecipes,
        locale: state.locale,
        brightness: brightness));
  }

  void changeLocale(String locale) {
    emit(SettingsCurrentState(
      amountOfRecipes: state.amountOfRecipes,
      locale: locale,
      brightness: state.brightness,
    ));
  }
}
