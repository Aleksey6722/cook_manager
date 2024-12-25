import 'package:bloc/bloc.dart';
import 'package:cook_manager/data/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'amount_recipes_state.dart';

@singleton
class AmountRecipesCubit extends Cubit<AmountRecipesState> {
  final DataRepository _dataRepository;

  AmountRecipesCubit(DataRepository dataRepository)
      : _dataRepository = dataRepository,
        super(AmountRecipesState(0));

  void getAmountOfRecipes() async  {
    int amount = await _dataRepository.getAmountOfRecipes();
    emit(AmountRecipesState(amount));
  }
}
