import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/domain/settings/settings_cubit.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recipe_state.dart';

@singleton
class RecipeCubit extends Cubit<RecipeState> {
  final DataRepository _dataRepository;
  final SettingsCubit _settingsCubit;

  RecipeCubit(DataRepository dataRepository, SettingsCubit settingsCubit)
      : _dataRepository = dataRepository,
        _settingsCubit = settingsCubit,
        super(RecipeStateLoading());

  Future<void> switchFavourite(int id) async {
    Recipe recipe = await _dataRepository.getRecipe(id);
    bool isUpdated = await _dataRepository.updateRecipe(
      recipe.rowid!,
      recipe.copyWith(isFavourite: !recipe.isFavourite),
    );
    if (isUpdated) {
      recipe.isFavourite
          ? Fimber.d('Recipe ${recipe.title} removed from favourite')
          : Fimber.d('Recipe ${recipe.title} added to favourite');
    } else {
      Fimber.d('Error with updating recipe (id: ${recipe.rowid})');
    }
  }

  Future<void> getRecipe(int id) async {
    try {
      final Recipe recipe = await _dataRepository.getRecipe(id);
      emit(RecipeStateLoaded(recipe));
    } catch (e, stacktrace) {
      emit(RecipeStateError());
      Fimber.e(
        'Error with getting recipe (id: $id)',
        ex: e,
        stacktrace: stacktrace,
      );
    }
  }

  void deleteRecipe(int id) async {
    await _dataRepository.deleteRecipe(id);
    _settingsCubit.changeAmountOfRecipes();
    Fimber.d('Recipe with id: $id successfully deleted');
  }
}
