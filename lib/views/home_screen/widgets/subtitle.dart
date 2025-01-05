import 'package:cook_manager/generated/l10n.dart';
import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({super.key, required this.cookingTime, required this.numberOfPortions});
  final String cookingTime;
  final String numberOfPortions;

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
        const SizedBox(width: 5),
        _calculateTime(cookingTime, context),
        const SizedBox(width: 20),
        Icon(
          Icons.restaurant,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(S.of(context).portionsCount(num.parse(numberOfPortions))),
      ],
    );
  }

  Widget _calculateTime(String name,BuildContext context) {
    num time = num.parse(name);
    num totalMinutes = time * 60;
    int hours = totalMinutes ~/ 60;
    int minutes = (totalMinutes % 60).round();

    if (minutes == 0) {
      return Text(S.of(context).hoursCount(hours));
    } else {
      return Text('${S.of(context).hoursCount(hours)} ${S.of(context).minutesCount(minutes)}');
    }
  }

}
