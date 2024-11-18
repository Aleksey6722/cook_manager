import 'package:cook_manager/features/recipe_screen/bloc/recipe_bloc.dart';
import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({super.key, required this.state});

  final RecipeStateLoaded state;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 8),
        _calculateTime(state.recipe.cookingTime),
        const SizedBox(width: 20),
        Icon(
          Icons.restaurant,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 8),
        _calculatePortions(state.recipe.numberOfPortions),
      ],
    );
  }

  Widget _calculateTime(String name) {
    String result = '';
    num time = num.parse(name);
    num totalMinutes = time * 60;
    int hours = totalMinutes ~/ 60;
    int minutes = (totalMinutes % 60).round();
    if (hours > 4 && hours < 21) {
      result = '$hours часов';
    } else if (hours % 10 == 1) {
      result = '$hours час';
    } else if ([2, 3, 4].contains(hours % 10)) {
      result = '$hours часа';
    }

    if (minutes == 0) {
      return Text(result);
    }

    if (minutes > 4 && minutes < 21) {
      return Text('$result $minutes минут');
    } else if (minutes % 10 == 1) {
      return Text('$result $minutes минута');
    }
    return Text('$result $minutes минуты');
  }

  Widget _calculatePortions(String name) {
    num portions = num.parse(name);
    if (portions > 4 && portions < 21) {
      return Text('$portions порций');
    } else if (portions % 10 == 1) {
      return Text('$portions порция');
    }
    return Text('$portions порции');
  }

}
