import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recipe_state.dart';

@singleton
class RecipeCubit extends Cubit<RecipeState> {
  final DataRepository _dataRepository;

  RecipeCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(RecipeStateLoading());

  //  Future<void> switchFavourite(Recipe recipe) async {
  //   Recipe newRecipe = recipe.copyWith(isFavourite: !recipe.isFavourite);
  //   await _dataRepository.updateRecipe(recipe.rowid!, newRecipe);
  // }

  Future<void> switchFavourite(int id) async {
    Recipe recipe = await _dataRepository.getRecipe(id);
    await _dataRepository.updateRecipe(
      recipe.rowid!,
      recipe.copyWith(isFavourite: !recipe.isFavourite),
    );
  }

  Future<void> getRecipe(int id) async {
    try {
      final Recipe recipe = await _dataRepository.getRecipe(id);
      emit(RecipeStateLoaded(recipe));
    } catch (e) {
      emit(RecipeStateError());
    }
  }

  void deleteRecipe(int id) async {
    await _dataRepository.deleteRecipe(id);
  }
}
