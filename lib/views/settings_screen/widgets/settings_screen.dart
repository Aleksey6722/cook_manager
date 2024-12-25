import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/domain/settings/amount_recipes_cubit.dart';
import 'package:cook_manager/domain/theme/theme_cubit.dart';
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
  final AmountRecipesCubit _amountRecipesCubit = GetIt.instance<AmountRecipesCubit>();
  final ThemeCubit _themeCubit = GetIt.instance<ThemeCubit>();


  @override
  void initState() {
    _amountRecipesCubit.getAmountOfRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BlocBuilder<ThemeCubit, ThemeState>(
                  bloc: _themeCubit,
                  builder: (context, state) {
                    return SettingsToggleCard(
                        title: 'Тёмная тема',
                        initValue: state.brightness == Brightness.dark,
                        onChanged: (bool val) {
                          _themeCubit.setTheme(
                              val ? Brightness.dark : Brightness.light);
                        });
                  },
                ),
                const SizedBox(height: 12),
                SettingsToggleCard(
                    title: "Английский язык",
                    initValue: false,
                    onChanged: (bool val) {}),
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
                    Text('Количество рецептов',
                        style: theme.textTheme.bodyLarge),
                    BlocBuilder<AmountRecipesCubit, AmountRecipesState>(
                      bloc: _amountRecipesCubit,
                      builder: (context, state) {
                        return Text(state.amount.toString(),
                            style: theme.textTheme.bodyLarge);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Версия приложения', style: theme.textTheme.bodyLarge),
                    Text('1.0.0', style: theme.textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
