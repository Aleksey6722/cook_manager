import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/domain/theme/theme_cubit.dart';
import 'package:cook_manager/router/router.dart';
import 'package:cook_manager/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const CookManager());
  final DatabaseService db = GetIt.instance<DatabaseService>();
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
  final ThemeCubit _themeCubit = GetIt.instance<ThemeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: _themeCubit,
      builder: (context, state) {
        return MaterialApp.router(
          title: 'CookManager',
          theme: getTheme(state.brightness),
          routerConfig: _router.config(),
        );
      },
    );
  }
}
