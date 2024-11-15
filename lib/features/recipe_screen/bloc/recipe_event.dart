part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRecipeEvent extends RecipeEvent {
  final int id;

  GetRecipeEvent({required this.id});

  @override
    List<Object?> get props => [id];
}