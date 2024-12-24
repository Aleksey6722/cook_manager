import 'package:cook_manager/domain/edit_recipe/structure_widget_bloc/structure_bloc.dart';
import 'package:cook_manager/models/ingredient.dart';
import 'package:cook_manager/utils/ingredient_field_type_enum.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:cook_manager/views/edit_screen/edit_screen.dart';
import 'package:get_it/get_it.dart';

class IngredientTile extends StatefulWidget {
  const IngredientTile({
    super.key,
    required this.index,
    required this.ingredient,
    required this.totalAmount,
    required this.currentIngredientsList,
  });

  final int index;
  final int totalAmount;
  final Ingredient ingredient;
  final List<Ingredient> currentIngredientsList;

  @override
  State<IngredientTile> createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  final StructureBloc _structureBloc = GetIt.instance<StructureBloc>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameFieldController =
        TextEditingController(text: widget.ingredient.name);
    TextEditingController valueFieldController =
        TextEditingController(text: widget.ingredient.value);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: const Alignment(0, 1.22),
        clipBehavior: Clip.none,
        children: [
          DottedBorder(
            dashPattern: const [12, 6],
            borderType: BorderType.RRect,
            borderPadding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 5),
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 40, top: 15),
            radius: const Radius.circular(10),
            color: theme.colorScheme.primary,
            strokeWidth: 1,
            child: Column(
              children: [
                BaseFormField(
                  labelText: "Ингредиент",
                  controller: nameFieldController,
                  onChanged: _setName,
                ),
                const SizedBox(height: 6),
                BaseFormField(
                  labelText: "Количество",
                  controller: valueFieldController,
                  onChanged: _setValue,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IngredientsButtonsBar(
              index: widget.index,
              totalAmount: widget.totalAmount,
              currentIngredientsList: widget.currentIngredientsList,
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
        currentList: widget.currentIngredientsList,
        fieldType: IngredientFieldType.value,
      ),
    );
  }

  void _setName(String? name) {
    _structureBloc.add(SetValueEvent(
      value: name,
      index: widget.index,
      currentList: widget.currentIngredientsList,
      fieldType: IngredientFieldType.name,
    ));
  }
}
