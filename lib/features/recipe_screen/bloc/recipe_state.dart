part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipeStateLoading extends RecipeState {}

class RecipeStateLoaded extends RecipeState {
  final Recipe recipe;

  RecipeStateLoaded(this.recipe);
}

class RecipeStateError extends RecipeState {}