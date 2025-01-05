import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsToggleCard extends StatelessWidget {
  const SettingsToggleCard({
    super.key,
    required this.title,
    required this.initValue,
    required this.onChanged,
  });

  final String title;
  final bool initValue;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: theme.textTheme.bodyLarge),
          CupertinoSwitch(value: initValue, onChanged: onChanged)
        ],
      ),
    );
  }
}
