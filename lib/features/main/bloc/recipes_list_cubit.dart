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
    // TODO: usecase with int = null
    final DatabaseService db = DatabaseService.instance;
    List<Recipe> result = await db.getRecipesByCategoryId(categoryId.toString());
    emit(RecipesListLoaded(listOfRecipes: result));
  }
}
