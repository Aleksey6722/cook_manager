import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  const BaseFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.onlyNumber = false,
    this.withSufficsIcon = false,
    this.maxLines,
    this.validator,
    this.initialValue,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  final String labelText;
  final String? hintText;
  final bool onlyNumber;
  final bool withSufficsIcon;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentTextColor = theme.colorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.only(
          top: 10, bottom: 0, left: 12, right: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            initialValue: initialValue,
            maxLines: maxLines,
            keyboardType: onlyNumber ? TextInputType.number : null,
            decoration: InputDecoration(
              label: Container(
                transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                child: Text(labelText),
              ),
              hintText: hintText,
              hintStyle: theme.textTheme.bodyMedium!
                  .copyWith(color: currentTextColor.withOpacity(0.5)),
              suffixIcon: withSufficsIcon
                  ? const Icon(Icons.keyboard_arrow_down_outlined, size: 30)
                  : null,
              suffixIconConstraints: const BoxConstraints(maxHeight: 30),
              border: InputBorder.none,
              errorStyle: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 0,
              ),
            ),
            validator: validator,
            textInputAction: TextInputAction.none,
            onSaved: onSaved,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
