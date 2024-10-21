part of 'structure_bloc.dart';

sealed class StructureState extends Equatable {
  late final List<Ingredient> _listOfIngredients;

  List<Ingredient> get listOfIngredients => _listOfIngredients;

  @override
  List<Object?> get props => [listOfIngredients];
}


class StructureCurrentState extends StructureState {
  StructureCurrentState({required this.listOfIngredients}); // Геттер попадает сразу в конструктор?  ?

  @override
  final List<Ingredient> listOfIngredients;

}