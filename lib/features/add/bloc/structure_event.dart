part of 'structure_bloc.dart';

sealed class StructureEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTileEvent extends StructureEvent {}

class RemoveTileEvent extends StructureEvent {}

class MoveTileUpEvent extends StructureEvent {}

class MoveTileDownEvent extends StructureEvent {}