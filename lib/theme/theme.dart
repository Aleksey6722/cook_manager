import 'package:flutter/material.dart';

ThemeData getTheme(Brightness brightness){
  return ThemeData(
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      labelStyle: TextStyle(fontSize: 20,),
      unselectedLabelStyle: TextStyle(fontSize: 20, ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: brightness,
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),// AppBar title
      bodyMedium: TextStyle(fontSize: 16),
      bodyLarge: TextStyle(fontSize: 18),
      labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(fontSize: 21),
      isDense: true,
    ),//button text, form label text
  );
}

