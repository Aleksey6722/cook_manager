import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/ingredient.dart';
import '../bloc/structure_bloc.dart';

class ButtonsBar extends StatefulWidget {
  const ButtonsBar({
    super.key,
    required this.index,
    required this.totalAmount,
    required this.currentIngredientsList,
  });

  final int index;
  final int totalAmount;
  final List<Ingredient> currentIngredientsList;

  @override
  State<ButtonsBar> createState() => _ButtonsBarState();
}

class _ButtonsBarState extends State<ButtonsBar> {
  final StructureBloc _structureBloc = GetIt.instance<StructureBloc>();

  @override
  Widget build(BuildContext context) {
    final bool isFirst = widget.index == 0;
    bool showAddButton = false;
    bool isLast = false;
    if (!isFirst && widget.index == widget.totalAmount - 1) {
      isLast = true;
    }
    if (widget.totalAmount == 1 || isLast) {
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
              onTap: isLast || widget.totalAmount == 1 ? null : _moveTileDown,
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
                      isLast || widget.totalAmount == 1
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
          visible: !(widget.totalAmount == 1),
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
    _structureBloc.add(
      AddTileEvent(currentList: widget.currentIngredientsList),
    );
  }

  void _moveTileUp() {
    _structureBloc.add(
      MoveTileUpEvent(
        index: widget.index,
        currentList: widget.currentIngredientsList,
      ),
    );
  }

  void _moveTileDown() {
    _structureBloc.add(
      MoveTileDownEvent(
        index: widget.index,
        currentList: widget.currentIngredientsList,
      ),
    );
  }

  void _removeTile() {
    _structureBloc.add(
      RemoveTileEvent(
        index: widget.index,
        currentList: widget.currentIngredientsList,
      ),
    );
  }
}
