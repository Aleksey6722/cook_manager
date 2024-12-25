part of 'amount_recipes_cubit.dart';

class AmountRecipesState extends Equatable {
  final int amount;

  const AmountRecipesState(this.amount);

  @override
  List<Object?> get props => [amount];
}
