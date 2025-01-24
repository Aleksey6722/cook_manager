part of 'settings_cubit.dart';

final class SettingsCurrentState extends Equatable {
  final int amountOfRecipes;
  final Brightness brightness;
  final String locale;
  final SharedPreferencesHelper sharedPreferencesHelper =
      GetIt.instance<SharedPreferencesHelper>();

  SettingsCurrentState({
    this.amountOfRecipes = 0,
    required this.brightness,
    required this.locale,
  });

  @override
  List<Object?> get props => [amountOfRecipes, brightness, locale];
}
