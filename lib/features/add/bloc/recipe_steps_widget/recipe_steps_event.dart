part of 'recipe_steps_bloc.dart';

sealed class RecipeStepsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddStepEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;

  AddStepEvent({required this.currentList});
}

class RemoveStepEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;

  RemoveStepEvent({required this.currentList, required this.index});
}

class MoveStepUpEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;

  MoveStepUpEvent({required this.currentList, required this.index});
}

class MoveStepDownEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;

  MoveStepDownEvent({required this.currentList, required this.index});
}

class SetStepValueEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;
  final String? value;

  SetStepValueEvent({
    required this.currentList,
    required this.index,
    required this.value,
  });
}
