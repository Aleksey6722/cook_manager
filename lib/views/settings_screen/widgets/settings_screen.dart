import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/domain/settings/settings_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';
import 'package:cook_manager/views/settings_screen/widgets/settings_toggle_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsCubit _settingsCubit = GetIt.instance<SettingsCubit>();

  @override
  void initState() {
    _settingsCubit.changeAmountOfRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
      ),
      body: BlocBuilder<SettingsCubit, SettingsCurrentState>(
        bloc: _settingsCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SettingsToggleCard(
                        title: S.of(context).dark_theme,
                        initValue: state.brightness == Brightness.dark,
                        onChanged: (bool val) {
                          _settingsCubit.changeTheme(
                              val ? Brightness.dark : Brightness.light);
                        }),
                    const SizedBox(height: 12),
                    SettingsToggleCard(
                        title: 'English language',
                        initValue: state.locale == 'en',
                        onChanged: (bool val) {
                          _settingsCubit.changeLocale(val ? 'en' : 'ru');
                        }),
                  ],
                ),
                Column(
                  children: [
                    Divider(
                      color: theme.colorScheme.onSurface.withOpacity(0.1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).amount_of_recipes,
                            style: theme.textTheme.bodyLarge),
                        Text(state.amountOfRecipes.toString(),
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).app_version,
                            style: theme.textTheme.bodyLarge),
                        Text('1.0.0', style: theme.textTheme.bodyLarge),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
