import 'package:bloc/bloc.dart';
import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'favourite_list_state.dart';

@singleton
class FavouriteListCubit extends Cubit<FavouriteListState> {
  final DataRepository _dataRepository;

  FavouriteListCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(FavouriteListInitial());

  Future<void> getRecipes({bool emitInitState = true}) async {
    if (emitInitState) {
      emit(FavouriteListInitial());
    }
    List<Recipe> result = await _dataRepository.getFavouriteRecipes();
    emit(FavouriteListLoaded(listOfRecipes: result));
  }
}
