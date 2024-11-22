part of 'recipe_steps_bloc.dart';

sealed class RecipeStepsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddStepEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;

  AddStepEvent({required this.currentList});

  @override
  List<Object?> get props => [currentList];
}

class RemoveStepEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;

  RemoveStepEvent({required this.currentList, required this.index});

  @override
  List<Object?> get props => [currentList, index];
}

class MoveStepUpEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;

  MoveStepUpEvent({required this.currentList, required this.index});

  @override
  List<Object?> get props => [currentList, index];
}

class MoveStepDownEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;

  MoveStepDownEvent({required this.currentList, required this.index});
  @override
  List<Object?> get props => [currentList, index];
}

class GetInitSteps extends RecipeStepsEvent {}

class SetStepValueEvent extends RecipeStepsEvent {
  final List<RecipeStep> currentList;
  final int index;
  final String? value;

  SetStepValueEvent({
    required this.currentList,
    required this.index,
    required this.value,
  });

  @override
  List<Object?> get props => [currentList, index, value];
}

class EditingStepsEvent extends RecipeStepsEvent {
  final List<RecipeStep> editingStepsList;

  EditingStepsEvent({required this.editingStepsList});
}
