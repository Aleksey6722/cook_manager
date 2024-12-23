import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(SearchInitState());
  final DataRepository _dataRepository;

  Future<void> searchRecipes(String text) async {
    List<Recipe> result = await _dataRepository.findText(text);
    if(result.isEmpty) {
      emit(SearchEmptyState());
    } else {
      emit(SearchLoadedState(listOfRecipes: result));
    }
  }

  Future<void> getEmptyState() async {
    emit(SearchEmptyState());
  }
}
