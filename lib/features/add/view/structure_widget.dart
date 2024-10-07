import 'package:flutter/material.dart';
import 'ingredient_tile.dart';

class StructureWidget extends StatefulWidget {
  const StructureWidget({super.key});

  @override
  State<StructureWidget> createState() => _StructureWidgetState();
}

class _StructureWidgetState extends State<StructureWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(children: [
      IngredientTile(),
      IngredientTile(),
    ],);
  }
}
