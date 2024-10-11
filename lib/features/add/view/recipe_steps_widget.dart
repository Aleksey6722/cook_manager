import 'package:cook_manager/features/add/bloc/recipe_steps_widget/recipe_steps_bloc.dart';
import 'package:cook_manager/features/add/view/recipe_step_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RecipeStepsWidget extends StatefulWidget {
  const RecipeStepsWidget({super.key});

  @override
  State<RecipeStepsWidget> createState() => _RecipeStepsWidgetState();
}

class _RecipeStepsWidgetState extends State<RecipeStepsWidget> {
  final RecipeStepsBloc _recipeStepsBloc = GetIt.instance<RecipeStepsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _recipeStepsBloc,
      child: BlocBuilder<RecipeStepsBloc, RecipeStepsState>(
        builder: (context, state) {
          final ingredientList = state.listOfSteps.asMap().entries;
          final int totalAmount = ingredientList.length;
          return Column(
            children: [
              ...ingredientList.map(
                (entry) => RecipeStepTile(
                  index: entry.key,
                  recipeStep: entry.value,
                  totalAmount: totalAmount,
                  currentStepsList: state.listOfSteps,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
