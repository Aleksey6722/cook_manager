import 'package:cook_manager/utils/ingredient.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:cook_manager/features/add/add.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    super.key,
    required this.index,
    required this.ingredient,
    required this.totalAmount,
  });

  final int index;
  final int totalAmount;
  final Ingredient ingredient;

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
                ),
                SizedBox(height: 6),
                BaseFormField(labelText: "Количество"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ButtonsBar(
              index: index,
              totalAmount: totalAmount,
            ),
          ),
        ],
      ),
    );
  }
}
