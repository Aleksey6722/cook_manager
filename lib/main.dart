import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const CookManager());
  final DatabaseService db = GetIt.instance<DatabaseService>();
  // final DatabaseService db = DatabaseService.instance;
  // db.deleteDB();
  // db.showData();
}

class CookManager extends StatefulWidget {
  const CookManager({super.key});

  @override
  State<CookManager> createState() => _CookManagerState();
}

class _CookManagerState extends State<CookManager> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CookManager',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 0,
          labelStyle: TextStyle(fontSize: 20,),
          unselectedLabelStyle: TextStyle(fontSize: 20, ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
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
          bodyLarge: TextStyle(fontSize: 16),
          labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(fontSize: 21),
          isDense: true,
        ),//button text, form label text
      ),
      routerConfig: _router.config(),
    );
  }
}
