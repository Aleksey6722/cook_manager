import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/add/add.dart';
import 'package:cook_manager/features/add/view/base_form_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _addRecepieFormKey = GlobalKey<FormState>();
  String? name,
      time,
      numberOfPortions,
      category,
      description,
      proteins,
      carbs,
      fats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить рецепт', style: theme.textTheme.headlineSmall),
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: _addRecepieFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Название',
                        underlined: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Введите название';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          name = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Время приготовления',
                        hintText: 'Часов',
                        onlyNumber: true,
                        underlined: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Введите время приготовления';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          time = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Количество порций',
                        initialValue: '4',
                        underlined: true,
                        onSaved: (val) {
                          numberOfPortions = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      CategoryFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Выберите категорию';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          category = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Описание',
                        expandable: true,
                        onSaved: (val) {
                          description = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      NutritionalValueWidget(),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Ссылка на источник',
                        hintText: 'https://',
                        underlined: true,
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      if (_addRecepieFormKey.currentState!.validate()) {
                        _addRecepieFormKey.currentState!.save();
                        print(
                            '$name, $time, $numberOfPortions, $category, $description');
                      }
                    },
                    child: Text('Добавить рецепт'),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
