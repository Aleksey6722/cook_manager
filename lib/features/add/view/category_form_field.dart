import 'dart:math';

import 'package:cook_manager/features/main/bloc/category_bloc.dart';
import 'package:cook_manager/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CategoryFormField extends StatefulWidget {
  const CategoryFormField({
    super.key, this.validator, this.onSaved, required this.categoryController,
  });

  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextEditingController categoryController;

  @override
  State<CategoryFormField> createState() => _CategoryFormFieldState();
}

class _CategoryFormFieldState extends State<CategoryFormField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _boxAnimation;
  late Animation<double> _iconAnimation;

  final CategoryBloc _categoryBloc = GetIt.instance<CategoryBloc>();

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
    final List<Category> categories = (_categoryBloc.state as CategoryStateLoaded).listOfCategories;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
      decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.categoryController,
            onTap: _toggle,
            onSaved: widget.onSaved,
            readOnly: true,
            decoration: InputDecoration(
              label: Container(
                transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                child: const Text('Категория'),
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
              // border: InputBorder.none,
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
                    String name = categories[index].name;
                    return GestureDetector(
                      onTap: () {
                        widget.categoryController.text = name;
                        _toggle();
                      },
                      child: Text(name),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: categories.length,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
