part of 'recipes_list_cubit.dart';

sealed class RecipesListState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RecipesListInitial extends RecipesListState {}

final class RecipesListLoaded extends RecipesListState {
  final List<Recipe> listOfRecipes;

  RecipesListLoaded({required this.listOfRecipes});

  @override
  List<Object?> get props => super.props..addAll([listOfRecipes]);
}
