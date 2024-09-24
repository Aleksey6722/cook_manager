import 'package:flutter/material.dart';

class NutritionalValueWidget extends StatelessWidget {
  const NutritionalValueWidget({
    super.key,
    this.hintText,
    this.isOnlyNumber = false,
    this.withSufficsIcon = false,
    this.expandable = false,
  });

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
          const Text('Пищевая ценность'),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Белки: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '20 г',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Жиры: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '20 г',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Углеводы: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '20 г',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Калории: "),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '342',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    border: InputBorder.none,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
