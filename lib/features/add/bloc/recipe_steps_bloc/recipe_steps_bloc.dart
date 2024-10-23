import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/recipe_step.dart';

part 'recipe_steps_event.dart';

part 'recipe_steps_state.dart';

@singleton
class RecipeStepsBloc extends Bloc<RecipeStepsEvent, RecipeStepsState> {
  RecipeStepsBloc()
      : super(RecipeStepsCurrentState(listOfSteps: [RecipeStep()])) {
    on<SetStepValueEvent>(_mapSetStepValueEvent);
    on<MoveStepUpEvent>(_mapMoveStepUpEventToState);
    on<MoveStepDownEvent>(_mapMoveStepDownEventToState);
    on<AddStepEvent>(_mapAddStepEventToState);
    on<RemoveStepEvent>(_mapRemoveStepEventToState);
  }

  void _mapSetStepValueEvent(SetStepValueEvent event, emmit) {
    RecipeStep step = event.currentList[event.index];
    // step.setStepText = event.value;
    event.currentList.replaceRange(event.index, event.index+1, [step.copyWith(stepText: event.value)]);
    emmit(RecipeStepsCurrentState(listOfSteps: event.currentList));
  }

  void _mapMoveStepUpEventToState(MoveStepUpEvent event, emmit) {
    RecipeStep step = event.currentList[event.index];
    final List<RecipeStep> newList = event.currentList.toList();
    newList.insert(event.index - 1, step);
    newList.removeAt(event.index + 1);
    emmit(RecipeStepsCurrentState(listOfSteps: newList));
  }

  void _mapMoveStepDownEventToState(MoveStepDownEvent event, emmit){
    RecipeStep step = event.currentList[event.index];
    final List<RecipeStep> newList = event.currentList.toList();
    newList.insert(event.index +2, step);
    newList.removeAt(event.index);
    emmit(RecipeStepsCurrentState(listOfSteps: newList));
  }

  void _mapAddStepEventToState(AddStepEvent event, emmit){
    final List<RecipeStep> newList = event.currentList.toList();
    newList.add(RecipeStep());
    emmit(RecipeStepsCurrentState(listOfSteps: newList));
  }

  void _mapRemoveStepEventToState(RemoveStepEvent event, emmit){
    final List<RecipeStep> newList = event.currentList.toList();
    newList.removeAt(event.index);
    emmit(RecipeStepsCurrentState(listOfSteps: newList));
  }
}
