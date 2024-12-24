part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryStateLoading extends CategoryState {}

class CategoryStateLoaded extends CategoryState {
  final List<Category> listOfCategories;

  CategoryStateLoaded({required this.listOfCategories});

  @override
  List<Object?> get props => [listOfCategories];
}

