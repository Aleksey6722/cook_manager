import 'package:cook_manager/features/edit/bloc/recipe_steps_bloc/recipe_steps_bloc.dart';
import 'package:cook_manager/models/recipe_step.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:cook_manager/features/edit/edit.dart';
import 'package:get_it/get_it.dart';

class RecipeStepTile extends StatefulWidget {
  const RecipeStepTile({
    super.key,
    required this.index,
    required this.recipeStep,
    required this.totalAmount,
    required this.currentStepsList,
  });

  final int index;
  final int totalAmount;
  final RecipeStep recipeStep;
  final List<RecipeStep> currentStepsList;

  @override
  State<RecipeStepTile> createState() => _RecipeStepTileState();
}

class _RecipeStepTileState extends State<RecipeStepTile> {
  final RecipeStepsBloc _recipeStepsBloc = GetIt.instance<RecipeStepsBloc>();

  @override
  Widget build(BuildContext context) {
    TextEditingController stepFieldController =
        TextEditingController(text: widget.recipeStep.stepText);

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: const Alignment(0, 1.3),
        clipBehavior: Clip.none,
        children: [
          DottedBorder(
            dashPattern: const [12, 6],
            borderType: BorderType.RRect,
            borderPadding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 5),
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 40, top: 15),
            radius: const Radius.circular(10),
            color: theme.colorScheme.primary,
            strokeWidth: 1,
            child: Column(
              children: [
                BaseFormField(
                  labelText: "Шаг ${widget.index + 1}",
                  controller: stepFieldController,
                  onChanged: _setName,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RecipeStepsButtonsBar(
              index: widget.index,
              totalAmount: widget.totalAmount,
              currentStepsList: widget.currentStepsList,
            ),
          ),
        ],
      ),
    );
  }

  void _setName(String? name) {
    _recipeStepsBloc.add(SetStepValueEvent(
      value: name,
      index: widget.index,
      currentList: widget.currentStepsList,
    ));
  }
}
