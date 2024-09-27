import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/nutrition_label_bloc.dart';

class NutritionalValueWidget extends StatefulWidget {
  const NutritionalValueWidget({
    super.key,
    this.hintText,
    this.isOnlyNumber = false,
    this.withSufficsIcon = false,
    this.expandable = false,
  });

  final String? hintText;
  final bool isOnlyNumber;
  final bool withSufficsIcon;
  final bool expandable;

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
    final _currentPrimaryColor = theme.colorScheme.primary;
    final _currentTextColor = theme.colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => _labelColorBloc,
            child: BlocBuilder<NutritionLabelBloc, NutritionLabelState>(
                builder: (BuildContext context, state) {
              return Text(
                'Пищевая ценность',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: state.isLabelFocused
                        ? _currentPrimaryColor
                        : _currentTextColor),
              );
            }),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Белки: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _focusNodeProteins,
                  decoration: InputDecoration(
                    hintText: '20 г',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
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
              const Text("Жиры: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _focusNodeFats,
                  decoration: InputDecoration(
                    hintText: '20 г',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Углеводы: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _focusNodeCarb,
                  decoration: InputDecoration(
                    hintText: '20 г',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Калории: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _focusNodeCallories,
                  decoration: InputDecoration(
                    hintText: '342',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _listenFocus() {
    _labelColorBloc.add(NutritionLabelEventFocusedChanged(
      focus1: _focusNodeCallories,
      focus2: _focusNodeCarb,
      focus3: _focusNodeFats,
      focus4: _focusNodeProteins,
    ));
  }
}
