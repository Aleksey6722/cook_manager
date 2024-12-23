import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recipes_list_state.dart';

@singleton
class RecipesListCubit extends Cubit<RecipesListState> {
  final DataRepository _dataRepository;

  RecipesListCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(RecipesListInitial());

  Future<void> getRecipes(int? categoryId) async {
    if (categoryId == null) {
      List<Recipe> result = await _dataRepository.getAllRecipes();
      emit(RecipesListLoaded(listOfRecipes: result));
    } else {
      List<Recipe> result =
          await _dataRepository.getRecipesByCategoryId(categoryId);
      emit(RecipesListLoaded(listOfRecipes: result));
    }
  }

  void emitInitState() async {
    emit(RecipesListInitial());
  }

  void updateRecipeListPage(int? categoryId, bool isFromAllCategoryList) async {
    if (isFromAllCategoryList) {
      await getRecipes(null);
    } else if (categoryId != null) {
      await getRecipes(categoryId);
    }
  }
}
