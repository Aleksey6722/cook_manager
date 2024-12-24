part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCategoriesEvent extends CategoryEvent {}