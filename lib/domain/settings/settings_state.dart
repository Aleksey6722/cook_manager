part of 'settings_cubit.dart';

// sealed class SettingsState extends Equatable {
//   const SettingsState();
// }
//
// final class SettingsInitial extends SettingsState {
//   @override
//   List<Object> get props => [];
// }

final class SettingsCurrentState extends Equatable {
  final int amountOfRecipes;
  final Brightness brightness;
  final String locale;

  const SettingsCurrentState(
      {this.amountOfRecipes = 0, this.brightness = Brightness.light, this.locale = 'ru'});

  @override
  List<Object?> get props => [amountOfRecipes, brightness, locale];
}
