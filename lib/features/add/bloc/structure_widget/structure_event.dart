part of 'structure_bloc.dart';

sealed class StructureEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTileEvent extends StructureEvent {
  final List<Ingredient> currentList;

  AddTileEvent({required this.currentList});
}

class RemoveTileEvent extends StructureEvent {
  final int index;
  final List<Ingredient> currentList;

  RemoveTileEvent({
    required this.index,
    required this.currentList,
  });
}

class MoveTileUpEvent extends StructureEvent {
  final int index;
  final List<Ingredient> currentList;

  MoveTileUpEvent({required this.index, required this.currentList});
}

class MoveTileDownEvent extends StructureEvent {
  final int index;
  final List<Ingredient> currentList;

  MoveTileDownEvent({required this.index, required this.currentList});
}

class SetValueEvent extends StructureEvent {
  final int index;
  final String? value;
  final List<Ingredient> currentList;
  final FieldType fieldType;

  SetValueEvent({
    required this.value,
    required this.index,
    required this.currentList,
    required this.fieldType,
  });
}
