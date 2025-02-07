import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/domain/settings/settings_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';
import 'package:cook_manager/router/router.dart';
import 'package:cook_manager/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  final SettingsCubit _settingsCubit = GetIt.instance<SettingsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsCurrentState>(
      bloc: _settingsCubit,
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale(state.locale),
          supportedLocales: S.delegate.supportedLocales,
          title: 'CookManager',
          theme: getTheme(state.brightness),
          routerConfig: _router.config(),
        );
      },
    );
  }
}
