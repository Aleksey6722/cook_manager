import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  const BaseFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.onlyNumber = false,
    this.withSufficsIcon = false,
    this.expandable = false,
    this.underlined = false,
    this.validator,
    this.initialValue,
  });

  final String labelText;
  final String? hintText;
  final bool onlyNumber;
  final bool withSufficsIcon;
  final bool expandable;
  final bool underlined;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 16, left: 12, right: 12),
      decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: initialValue,
            maxLines: expandable ? 4 : null,
            keyboardType: onlyNumber ? TextInputType.number : null,
            decoration: InputDecoration(
              label: Container(
                transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                child: Text(labelText),
              ),
              hintText: hintText,
              border: underlined ? null : InputBorder.none,
              suffixIcon: withSufficsIcon
                  ? const Icon(Icons.keyboard_arrow_down_outlined, size: 30)
                  : null,
              suffixIconConstraints: const BoxConstraints(maxHeight: 30),
            ),
            validator: validator,
            textInputAction: TextInputAction.none,
          ),
        ],
      ),
    );
  }
}