import 'package:cook_manager/domain/edit_recipe/recipe_steps_bloc/recipe_steps_bloc.dart';
import 'package:cook_manager/models/recipe_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';


class RecipeStepsButtonsBar extends StatefulWidget {
  const RecipeStepsButtonsBar({
    super.key,
    required this.index,
    required this.totalAmount,
    required this.currentStepsList,
  });

  final int index;
  final int totalAmount;
  final List<RecipeStep> currentStepsList;

  @override
  State<RecipeStepsButtonsBar> createState() => _RecipeStepsButtonsBarState();
}

class _RecipeStepsButtonsBarState extends State<RecipeStepsButtonsBar> {
  final RecipeStepsBloc _recipeStepsBloc = GetIt.instance<RecipeStepsBloc>();

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
            Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 13,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: isFirst ? null : _moveTileUp,
                    icon: SvgPicture.asset(
                      'assets/icons/chevron-up-circle-outline.svg',
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        isFirst
                            ? theme.hintColor.withOpacity(0.2)
                            : theme.colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 13,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        shape: BoxShape.circle),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: isLast || widget.totalAmount == 1
                        ? null
                        : _moveTileDown,
                    icon: SvgPicture.asset(
                      'assets/icons/chevron-down-circle.svg',
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        isLast || widget.totalAmount == 1
                            ? theme.hintColor.withOpacity(0.2)
                            : theme.colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
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
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: !(widget.totalAmount == 1),
          replacement: const SizedBox(
            height: 56,
            width: 40,
          ),
          child: IconButton(
            onPressed: _removeTile,
            icon: const Icon(
              Icons.delete_rounded,
              size: 40,
              color: Color(0xFFd14141),
            ),
          ),
        ),
      ],
    );
  }

  void _addTile() {
    _recipeStepsBloc.add(
      AddStepEvent(currentList: widget.currentStepsList),
    );
  }

  void _moveTileUp() {
    _recipeStepsBloc.add(
      MoveStepUpEvent(
        index: widget.index,
        currentList: widget.currentStepsList,
      ),
    );
  }

  void _moveTileDown() {
    _recipeStepsBloc.add(
      MoveStepDownEvent(
        index: widget.index,
        currentList: widget.currentStepsList,
      ),
    );
  }

  void _removeTile() {
    _recipeStepsBloc.add(
      RemoveStepEvent(
        index: widget.index,
        currentList: widget.currentStepsList,
      ),
    );
  }
}
