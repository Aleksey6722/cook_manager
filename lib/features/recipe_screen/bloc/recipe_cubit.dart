import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/features/main/bloc/recipes_list_cubit.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part 'recipe_state.dart';

@singleton
class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeStateLoading());

  final RecipesListCubit _recipesListCubit = GetIt.instance<RecipesListCubit>();

  Future<void> switchFavourite(Recipe recipe) async {
    final DatabaseService db = DatabaseService.instance;
    Recipe newRecipe = recipe.copyWith(isFavourite: !recipe.isFavourite);
    await db.updateRecipe(recipe.id!, newRecipe);
  }

  Future<void> getRecipe(int id) async {
    final DatabaseService db = DatabaseService.instance;
    try {
      emit(RecipeStateLoading());
      final Recipe recipe = await db.getRecipe(id);
      emit(RecipeStateLoaded(recipe));
    } catch (e) {
      emit(RecipeStateError());
    }
  }

  void updateRecipeListPage(int? categoryId, bool isFromAllCategoryList) {
    if (isFromAllCategoryList) {
      _recipesListCubit.getRecipes(null);
    } else if (categoryId != null) {
      _recipesListCubit.getRecipes(categoryId);
    }
  }
}
