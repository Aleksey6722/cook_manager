part of 'recipe_cubit.dart';

sealed class RecipeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipeStateLoading extends RecipeState {}

class RecipeStateLoaded extends RecipeState {
  final Recipe recipe;

  RecipeStateLoaded(this.recipe);
  @override
  List<Object?> get props => super.props..add(recipe);
}

class RecipeStateError extends RecipeState {}