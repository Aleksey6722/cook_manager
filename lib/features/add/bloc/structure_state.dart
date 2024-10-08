part of 'structure_bloc.dart';

sealed class StructureState extends Equatable {
  late final List<Ingredient> _listOfIngredients;

  List<Ingredient> get listOfIngredients => _listOfIngredients;

  @override
  List<Object?> get props => [];
}

class StructureInitState extends StructureState {
  @override
  final List<Ingredient> listOfIngredients = [
    Ingredient(),
    Ingredient(),
    Ingredient(),
  ];
}

class StructureCurrentState extends StructureState {
  StructureCurrentState({required this.listOfIngredients});

  @override
  final List<Ingredient> listOfIngredients;

  @override
  List<Object?> get props => [listOfIngredients];
}
