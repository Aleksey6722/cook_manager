
import 'package:cook_manager/data/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsCurrentState> {
  final DataRepository _dataRepository;

  SettingsCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(const SettingsCurrentState());

  void changeAmountOfRecipes() async {
    int amount = await _dataRepository.getAmountOfRecipes();
    emit(SettingsCurrentState(
      brightness: state.brightness,
      amountOfRecipes: amount,
      locale: state.locale,
    ));
  }

  void changeTheme(Brightness brightness) {
    emit(SettingsCurrentState(
      amountOfRecipes: state.amountOfRecipes,
      locale: state.locale,
      brightness: brightness
    ));
  }

  void changeLocale(String locale) {
    emit(SettingsCurrentState(
        amountOfRecipes: this.state.amountOfRecipes,
        locale: locale,
        brightness: this.state.brightness,
    ));
  }
}
