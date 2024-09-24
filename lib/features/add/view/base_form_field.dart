import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  const BaseFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.isOnlyNumber = false,
    this.withSufficsIcon = false,
    this.expandable = false,
  });

  final String labelText;
  final String? hintText;
  final bool isOnlyNumber;
  final bool withSufficsIcon;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText),
          TextField(
            maxLines: expandable ? 4 : null,
            keyboardType: isOnlyNumber ? TextInputType.number : null,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              border: InputBorder.none,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8)
              // ),
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(8),
              //   borderSide: BorderSide(color: theme.primaryColor),
              // ),
              suffixIcon: withSufficsIcon
                  ? const Icon(Icons.keyboard_arrow_down_outlined, size: 30)
                  : null,
              suffixIconConstraints: BoxConstraints(maxHeight: 30),
            ),
          ),
        ],
      ),
    );
  }
}
