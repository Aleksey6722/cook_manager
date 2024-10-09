part of 'structure_bloc.dart';

sealed class StructureState extends Equatable {
  late final List<Ingredient> _IngredientsAll;

  List<Ingredient> get listOfIngredients => _IngredientsAll;

  @override
  List<Object?> get props => [];
}


class StructureCurrentState extends StructureState {
  StructureCurrentState({required this.listOfIngredients});


  @override
  final List<Ingredient> listOfIngredients;

  @override
  List<Object?> get props => [listOfIngredients];
}
