import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/ingredient.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    super.key,
    required this.index,
    required this.totalAmount,
    required this.totalIngredientsList,
  });

  final int index;
  final int totalAmount;
  final List<Ingredient> totalIngredientsList;

  @override
  Widget build(BuildContext context) {
    final bool isFirst = index == 0;
    bool showAddButton = false;
    bool isLast = false;
    if (!isFirst && index == totalAmount - 1) {
      isLast = true;
    }
    if (totalAmount == 1 || isLast) {
      showAddButton = true;
    }

    final theme = Theme.of(context);
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: isFirst ? null : _moveTileUp,
              child: Stack(
                children: [
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          shape: BoxShape.circle),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/chevron-up-circle-outline.svg',
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      isFirst
                          ? theme.hintColor.withOpacity(0.2)
                          : theme.colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: isLast || totalAmount == 1 ? null : _moveTileDown,
              child: Stack(
                children: [
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          shape: BoxShape.circle),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/chevron-down-circle.svg',
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      isLast || totalAmount == 1
                          ? theme.hintColor.withOpacity(0.2)
                          : theme.colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(flex: 25),
        Visibility(
          visible: showAddButton,
          replacement: Container(height: 56),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: theme.colorScheme.surface, shape: BoxShape.circle),
              ),
              IconButton(
                onPressed: _addTile,
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 35),
        Visibility(
          visible: !(totalAmount == 1),
          replacement: const SizedBox(
            height: 56,
            width: 40,
          ),
          child: GestureDetector(
            onTap: _removeTile,
            child: const Icon(
              Icons.delete_rounded,
              size: 40,
              color: Color(0xFFb84848),
            ),
          ),
        ),
      ],
    );
  }

  void _addTile() {
    // TODO: add new tile
    print('New tile  added after $index');
  }

  void _moveTileUp() {
    // TODO: move tile up
    print('Tile $index moved up');
  }

  void _moveTileDown() {
    // TODO: move tile down
    print('Tile $index moved down');
  }

  void _removeTile() {
    // TODO: remove tile
    print('Tile $index removed');
  }
}
