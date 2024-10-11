import 'package:cook_manager/features/add/bloc/nutrition_label_widget/nutrition_label_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NutritionalValueWidget extends StatefulWidget {
  const NutritionalValueWidget({super.key});

  @override
  State<NutritionalValueWidget> createState() => _NutritionalValueWidgetState();
}

class _NutritionalValueWidgetState extends State<NutritionalValueWidget> {
  final NutritionLabelBloc _labelColorBloc =
      GetIt.instance<NutritionLabelBloc>();

  final FocusNode _focusNodeProteins = FocusNode();
  final FocusNode _focusNodeFats = FocusNode();
  final FocusNode _focusNodeCarb = FocusNode();
  final FocusNode _focusNodeCallories = FocusNode();

  @override
  void initState() {
    _focusNodeCallories.addListener(_listenFocus);
    _focusNodeCarb.addListener(_listenFocus);
    _focusNodeProteins.addListener(_listenFocus);
    _focusNodeFats.addListener(_listenFocus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentPrimaryColor = theme.colorScheme.primary;
    final currentTextColor = theme.colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10)),
      child: BlocProvider(
        create: (context) => _labelColorBloc,
        child: BlocBuilder<NutritionLabelBloc, NutritionLabelState>(
          builder: (BuildContext context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Пищевая ценность',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: state.isLabelFocused
                          ? currentPrimaryColor
                          : currentTextColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Белки: ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: state.isProteinsLabelFocused
                              ? currentPrimaryColor
                              : currentTextColor),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: _focusNodeProteins,
                        decoration: InputDecoration(
                          hintText: '20 г',
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                              color: currentTextColor.withOpacity(0.5)),
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 1),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Жиры: ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: state.isFatsLabelFocused
                              ? currentPrimaryColor
                              : currentTextColor),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: _focusNodeFats,
                        decoration: InputDecoration(
                          hintText: '20 г',
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                              color: currentTextColor.withOpacity(0.5)),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 1),
                          border: InputBorder.none,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Углеводы: ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: state.isCarbsLabelFocused
                              ? currentPrimaryColor
                              : currentTextColor),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: _focusNodeCarb,
                        decoration:  InputDecoration(
                          hintText: '20 г',
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                              color: currentTextColor.withOpacity(0.5)),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 1),
                          border: InputBorder.none,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Калории: ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: state.isCallorLabelFocused
                              ? currentPrimaryColor
                              : currentTextColor),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: _focusNodeCallories,
                        decoration: InputDecoration(
                          hintText: '342',
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                              color: currentTextColor.withOpacity(0.5)),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 1),
                          border: InputBorder.none,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _listenFocus() {
    _labelColorBloc.add(NutritionLabelEventFocusedChanged(
      callories: _focusNodeCallories,
      carbones: _focusNodeCarb,
      fats: _focusNodeFats,
      proteins: _focusNodeProteins,
    ));
  }
}
