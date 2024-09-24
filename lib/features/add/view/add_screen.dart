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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить рецепт'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
                      BaseFormField(labelText: 'Название'),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Время приготовления',
                        hintText: 'Часов',
                        isOnlyNumber: true,
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                          labelText: 'Количество порций', hintText: '4'),
                      const SizedBox(height: 10),
                      BaseFormField(
                          labelText: 'Категория', withSufficsIcon: true),
                      const SizedBox(height: 10),
                      BaseFormField(labelText: 'Описание', expandable: true),
                      const SizedBox(height: 10),
                      NutritionalValueWidget(),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Ссылка на источник',
                        hintText: 'https://',
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
                    onPressed: () {},
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
