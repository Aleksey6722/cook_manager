part of 'favourite_list_cubit.dart';

@immutable
sealed class FavouriteListState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FavouriteListInitial extends FavouriteListState {}

final class FavouriteListLoaded extends FavouriteListState {
  final List<Recipe> listOfRecipes;

  FavouriteListLoaded({required this.listOfRecipes});

  @override
  List<Object?> get props => super.props..addAll([listOfRecipes]);
}
