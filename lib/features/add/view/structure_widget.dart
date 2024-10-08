import 'package:cook_manager/features/add/bloc/structure_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'ingredient_tile.dart';

class StructureWidget extends StatefulWidget {
  const StructureWidget({super.key});

  @override
  State<StructureWidget> createState() => _StructureWidgetState();
}

class _StructureWidgetState extends State<StructureWidget> {
  final StructureBloc _structureBloc = GetIt.instance<StructureBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _structureBloc,
      child: BlocBuilder<StructureBloc, StructureState>(
        builder: (context, state) {
          final ingredientList = state.listOfIngredients.asMap().entries;
          final int totalAmount = ingredientList.length;
          return Column(
            children: [
              ...ingredientList.map(
                (entry) => IngredientTile(
                  index: entry.key,
                  ingredient: entry.value,
                  totalAmount: totalAmount,
                  totalIngredientsList: state.listOfIngredients,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
