part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => [];
}

final class SearchEmptyState extends SearchState {}

final class SearchInitState extends SearchState {}

final class SearchLoadedState extends SearchState {
  final List<Recipe> listOfRecipes;

  const SearchLoadedState({required this.listOfRecipes});

  @override
  List<Object?> get props => super.props..add(listOfRecipes);
}
