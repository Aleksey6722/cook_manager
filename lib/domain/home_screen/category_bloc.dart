import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';
part 'category_state.dart';

@singleton
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(): super(CategoryStateLoading()) {
    on<GetCategoriesEvent>(_mapGetCategoriesEventToState);
  }

  void _mapGetCategoriesEventToState(GetCategoriesEvent event, Emitter<CategoryState> emmit) async {
    final DatabaseService db = DatabaseService.instance;
    final List<Category> list = await db.getCategories();
    emmit(CategoryStateLoaded(listOfCategories: list));
  }

}