import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  final SharedPreferences _preferences;
  final Brightness initBrightness;

  ThemeStorage._(this.initBrightness, this._preferences);

  static Future<ThemeStorage>create() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("theme") ?? 'light';
    Brightness brightness = name == 'light' ? Brightness.light : Brightness.dark;
    return ThemeStorage._(brightness, prefs);
  }

  saveTheme(String name) async {
    _preferences.setString("theme", name);
  }

 }