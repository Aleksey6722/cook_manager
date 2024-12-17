import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';

part 'category_state.dart';

@singleton
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final DataRepository _dataRepository;

  CategoryBloc(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(CategoryStateLoading()) {
    on<GetCategoriesEvent>(_getCategories);
  }

  void _getCategories(
      GetCategoriesEvent event, Emitter<CategoryState> emmit) async {
    final List<Category> list = await _dataRepository.getCategories();
    emmit(CategoryStateLoaded(listOfCategories: list));
  }
}
