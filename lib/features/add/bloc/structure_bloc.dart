import 'package:cook_manager/utils/field_type_enum.dart';
import 'package:cook_manager/utils/ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'structure_event.dart';

part 'structure_state.dart';

@singleton
class StructureBloc extends Bloc<StructureEvent, StructureState> {
  StructureBloc()
      : super(StructureCurrentState(listOfIngredients: [Ingredient()])) {
    on<SetValueEvent>(_mapSetValueEventToState);
    on<MoveTileUpEvent>(_mapMoveTileUpEventToState);
    on<MoveTileDownEvent>(_mapMoveTileDownEventToState);
    on<AddTileEvent>(_mapAddTileEventToState);
    on<RemoveTileEvent>(_mapRemoveTileEventToState);
  }

  _mapSetValueEventToState(event, emmit) {
    Ingredient ingredient = event.currentList[event.index];
    switch (event.fieldType) {
      case FieldType.name:
        ingredient.setName = event.value;
      case FieldType.value:
        ingredient.setValue = event.value;
    }
    event.currentList.replaceRange(event.index, event.index + 1, [ingredient]);
    emmit(StructureCurrentState(listOfIngredients: event.currentList));
  }

  _mapMoveTileUpEventToState(event, emmit) {
    Ingredient ingredient = event.currentList[event.index];
    final List<Ingredient> newList = event.currentList.toList();
    newList.insert(event.index - 1, ingredient);
    newList.removeAt(event.index + 1);
    emmit(StructureCurrentState(listOfIngredients: newList));
  }

  _mapMoveTileDownEventToState(event, emmit) {
    Ingredient ingredient = event.currentList[event.index];
    final List<Ingredient> newList = event.currentList.toList();
    newList.insert(event.index + 2, ingredient);
    newList.removeAt(event.index);
    emmit(StructureCurrentState(listOfIngredients: newList));
  }

  _mapAddTileEventToState(event, emmit) {
    final List<Ingredient> newList = event.currentList.toList();
    newList.add(Ingredient());
    emmit(StructureCurrentState(listOfIngredients: newList));
  }

  _mapRemoveTileEventToState(event, emmit) {
    final List<Ingredient> newList = event.currentList.toList();
    newList.removeAt(event.index);
    emmit(StructureCurrentState(listOfIngredients: newList));
  }
}
