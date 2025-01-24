import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesHelper {
  SharedPreferences? _preferences;
  final String key = "theme";

  _initialPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  saveTheme(String name) async {
    await _initialPreferences();
    _preferences!.setString(key, name);
  }

  Future<Brightness> getThemeMode() async {
    await _initialPreferences();
    String name = _preferences!.getString(key) ?? 'light';
    return name == 'light' ? Brightness.light : Brightness.dark;
  }

}