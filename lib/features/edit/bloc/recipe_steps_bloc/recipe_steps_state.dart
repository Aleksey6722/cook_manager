part of 'recipe_steps_bloc.dart';

sealed class RecipeStepsState extends Equatable {
  late final List<RecipeStep> _listOfSteps;

  List<RecipeStep> get listOfSteps => _listOfSteps;

  @override
  List<Object?> get props => [];
}

class RecipeStepsInitial extends RecipeStepsState {
  @override
  final List<RecipeStep> listOfSteps = [const RecipeStep()];
}

class RecipeStepsCurrentState extends RecipeStepsState {
  RecipeStepsCurrentState({required this.listOfSteps});

  @override
  final List<RecipeStep> listOfSteps;
  @override
    List<Object?> get props => [listOfSteps];

}