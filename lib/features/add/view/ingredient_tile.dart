import 'package:cook_manager/utils/field_type_enum.dart';
import 'package:cook_manager/utils/ingredient.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:cook_manager/features/add/add.dart';
import 'package:get_it/get_it.dart';

import '../bloc/structure_bloc.dart';

class IngredientTile extends StatefulWidget {
  const IngredientTile({
    super.key,
    required this.index,
    required this.ingredient,
    required this.totalAmount,
    required this.totalIngredientsList,
  });

  final int index;
  final int totalAmount;
  final Ingredient ingredient;
  final List<Ingredient> totalIngredientsList;

  @override
  State<IngredientTile> createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  final StructureBloc _structureBloc = GetIt.instance<StructureBloc>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: const Alignment(0, 1.42),
        clipBehavior: Clip.none,
        children: [
          DottedBorder(
            dashPattern: const [12, 6],
            borderType: BorderType.RRect,
            borderPadding: const EdgeInsets.all(5),
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 15),
            radius: const Radius.circular(10),
            color: theme.colorScheme.primary,
            strokeWidth: 1.5,
            child: Column(
              children: [
                BaseFormField(
                  labelText: "Ингредиент",
                  onChanged: _setName,
                ),
                const SizedBox(height: 6),
                BaseFormField(labelText: "Количество", onChanged: _setValue),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ButtonsBar(
              index: widget.index,
              totalAmount: widget.totalAmount,
              totalIngredientsList: widget.totalIngredientsList,
            ),
          ),
        ],
      ),
    );
  }

  void _setValue(String? value) {
    _structureBloc.add(
      SetValueEvent(
        value: value,
        index: widget.index,
        currentList: widget.totalIngredientsList,
        fieldType: FieldType.value,
      ),
    );
  }

  void _setName(String? name) {
    _structureBloc.add(SetValueEvent(
      value: name,
      index: widget.index,
      currentList: widget.totalIngredientsList,
      fieldType: FieldType.name,
    ));
  }
}
