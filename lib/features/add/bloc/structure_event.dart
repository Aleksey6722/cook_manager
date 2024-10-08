part of 'structure_bloc.dart';

sealed class StructureEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTileEvent extends StructureEvent {}

class RemoveTileEvent extends StructureEvent {}

class MoveTileUpEvent extends StructureEvent {}

class MoveTileDownEvent extends StructureEvent {}

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
