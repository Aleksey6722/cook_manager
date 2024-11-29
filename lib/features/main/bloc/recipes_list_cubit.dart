import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recipes_list_state.dart';

@singleton
class RecipesListCubit extends Cubit<RecipesListState> {
  RecipesListCubit() : super(RecipesListInitial());

  Future<void> getRecipes(int? categoryId) async {
    final DatabaseService db = DatabaseService.instance;
    if (categoryId == null) {
      List<Recipe> result = await db.getAllRecipes();
      emit(RecipesListLoaded(listOfRecipes: result));
    } else {
      List<Recipe> result =
          await db.getRecipesByCategoryId(categoryId.toString());
      emit(RecipesListLoaded(listOfRecipes: result));
    }
  }

  Future<void> switchFavourite(Recipe recipe) async {
    final DatabaseService db = DatabaseService.instance;
    bool isFavourite = !recipe.isFavourite;
    var json = recipe.toJson();
    json['is_favourite'] = isFavourite;
    Recipe newRecipe = Recipe.fromJson(json);
    await db.updateRecipe(recipe.id!, newRecipe);
  }
}
