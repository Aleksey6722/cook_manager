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
        title: Text('Добавить рецепт', style: theme.textTheme.headlineSmall),
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
                      BaseFormField(
                        labelText: 'Название',
                        underlined: true,
                        validator: (val) {
                          if(val!.isEmpty){
                            return 'Введите название';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Время приготовления',
                        hintText: 'Часов',
                        onlyNumber: true,
                        underlined: true,
                        validator: (val) {
                          if(val!.isEmpty) {
                            return 'Введите время приготовления';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Количество порций',
                        initialValue: '4',
                        underlined: true,
                      ),
                      const SizedBox(height: 10),
                      CategoryFormField(),
                      const SizedBox(height: 10),
                      BaseFormField(labelText: 'Описание', expandable: true),
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
                        print('Data is valid !');
                      }
                      ;
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
