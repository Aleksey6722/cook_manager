import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/domain/favourite/favourite_list_cubit.dart';

import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
          await _dataRepository.getRecipesByCategoryId(categoryId.toString());
      emit(RecipesListLoaded(listOfRecipes: result));
    }
  }

  void updateRecipeListPage(int? categoryId, bool isFromAllCategoryList) async {
    final FavouriteListCubit favouriteListCubit =
        GetIt.instance<FavouriteListCubit>();
    if (isFromAllCategoryList) {
      await getRecipes(null);
      favouriteListCubit.getRecipes();
    } else if (categoryId != null) {
      await getRecipes(categoryId);
      favouriteListCubit.getRecipes();
    }
  }
}
