import 'dart:math';

import 'package:cook_manager/utils/categories.dart';
import 'package:flutter/material.dart';

class CategoryFormField extends StatefulWidget {
  const CategoryFormField({
    super.key, this.validator,
  });

  final String? Function(String?)? validator;

  @override
  State<CategoryFormField> createState() => _CategoryFormFieldState();
}

class _CategoryFormFieldState extends State<CategoryFormField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _boxAnimation;
  late Animation<double> _iconAnimation;

  final categories = Categories();


  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _boxAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _iconAnimation =
        Tween<double>(begin: 0, end: pi).animate(_animationController);
    super.initState();
  }

  void _toggle() {
    if (_boxAnimation.status != AnimationStatus.completed) {
      _animationController.forward();
    } else {
      _animationController.animateBack(
          0, duration: const Duration(milliseconds: 400));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            onTap: _toggle,
            readOnly: true,
            decoration: InputDecoration(
              label: Container(
                transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                child: Text('Категории'),
              ),
              suffixIcon: AnimatedBuilder(
                animation: _iconAnimation,
                child: const Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                builder: (context, child) =>
                    Transform.rotate(
                      angle: _iconAnimation.value,
                      child: child,
                    ),
              ),
              suffixIconConstraints: const BoxConstraints(maxHeight: 30),
            ),
            validator: widget.validator,
          ),
          SizeTransition(
            sizeFactor: _boxAnimation,
            child: Column(
              children: [
                const SizedBox(height: 7),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _toggle();
                      },
                      child: Text(categories.items[index].name),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: categories.items.length,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
