import 'package:bloc/bloc.dart';
import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'favourite_list_state.dart';

@singleton
class FavouriteListCubit extends Cubit<FavouriteListState> {
  FavouriteListCubit() : super(FavouriteListInitial());

  Future<void> getRecipes({bool emitInitState = true}) async {
    final DatabaseService db = DatabaseService.instance;
    if (emitInitState) {
      emit(FavouriteListInitial());
    }
    List<Recipe> result = await db.getFavouriteRecipes();
    emit(FavouriteListLoaded(listOfRecipes: result));
  }
}
