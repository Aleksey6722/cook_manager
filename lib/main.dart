import 'package:cook_manager/router/router.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CookManager());
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
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, onPrimary: Colors.white),
        useMaterial3: true,
      ),
     routerConfig: _router.config(),
    );
  }
}

