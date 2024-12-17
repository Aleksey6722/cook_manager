import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recipe_state.dart';

@singleton
class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeStateLoading());

  final DatabaseService db = DatabaseService.instance;

  Future<void> switchFavourite(Recipe recipe) async {
    Recipe newRecipe = recipe.copyWith(isFavourite: !recipe.isFavourite);
    await db.updateRecipe(recipe.id!, newRecipe);
  }

  Future<void> getRecipe(int id) async {
    try {
      // emit(RecipeStateLoading());
      final Recipe recipe = await db.getRecipe(id);
      emit(RecipeStateLoaded(recipe));
    } catch (e) {
      emit(RecipeStateError());
    }
  }

    void deleteRecipe(int id) async {
    final DatabaseService db = DatabaseService.instance;
    await db.deleteRecipe(id);
  }

}
