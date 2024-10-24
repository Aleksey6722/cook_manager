import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/database/database.dart';
import 'package:cook_manager/features/add/add.dart';
import 'package:cook_manager/features/add/bloc/image_box_bloc/image_box_bloc.dart';
import 'package:cook_manager/features/add/bloc/recipe_steps_bloc/recipe_steps_bloc.dart';
import 'package:cook_manager/features/add/bloc/structure_widget_bloc/structure_bloc.dart';

import 'package:cook_manager/features/add/view/base_form_field.dart';
import 'package:cook_manager/features/add/view/image_box.dart';
import 'package:cook_manager/features/add/view/structure_widget.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _addRecipeFormKey = GlobalKey<FormState>();
  String title = '', cookingTime = '', numberOfPortions = '', category = '';
  String? description, proteins, carbohydrates, calories, fats, recipeUrl;

  final RecipeStepsBloc _recipeStepsBloc = GetIt.instance<RecipeStepsBloc>();
  final StructureBloc _structureBloc = GetIt.instance<StructureBloc>();
  final ImageBoxBloc _imageBoxBloc = GetIt.instance<ImageBoxBloc>();
  final database = GetIt.instance<CookManagerDatabase>();

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: _addRecipeFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      ImageBox(),
                      const SizedBox(height: 15),
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
                          title = val!;
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
                          cookingTime = val!;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Количество порций',
                        initialValue: '4',
                        underlined: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Укажите количество порций';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          numberOfPortions = val!;
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
                          category = val!;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Описание',
                        maxLines: 3,
                        onSaved: (val) {
                          description = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      NutritionalValueWidget(
                        onSavedFats: (val) => fats = val,
                        onSavedProteins: (val) => proteins = val,
                        onSavedCarbo: (val) => carbohydrates = val,
                        onSavedCallories: (val) => calories = val,
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Ссылка на источник',
                        hintText: 'https://',
                        underlined: true,
                        onSaved: (val) {
                          recipeUrl = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Состав',
                            style: theme.textTheme.titleLarge,
                          ),
                        ],
                      ),
                      StructureWidget(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Пошаговый рецепт',
                            style: theme.textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const RecipeStepsWidget(),
                      const SizedBox(height: 60),
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    onPressed: () async {
                      if (_addRecipeFormKey.currentState!.validate()) {
                        _addRecipeFormKey.currentState!.save();
                        print(
                            '$title, $cookingTime, $numberOfPortions, $category, $description');
                        print('${proteins}, $fats, $carbohydrates, $calories');
                        print(_structureBloc.state.listOfIngredients);
                        print(_recipeStepsBloc.state.listOfSteps);
                        print(_imageBoxBloc.state.imageFile?.path);
                        database.insertRecipe(RecipeCompanion(
                          title: drift.Value(title),
                          cookingTime: drift.Value(cookingTime),
                          numberOfPortions: drift.Value(numberOfPortions),
                          category: drift.Value(1),
                          description: drift.Value(description),
                          proteins: drift.Value(proteins),
                          fats: drift.Value(fats),
                          carbohydrates: drift.Value(carbohydrates),
                          calories: drift.Value(calories),
                          recipeUrl: drift.Value(recipeUrl),
                          listOfIngredients: drift.Value(_structureBloc.state.listOfIngredients[0].toJson().toString()),
                          listOfSteps: drift.Value('List of Steps'),
                          isFavourite: drift.Value(false),
                        ));
                        final f = await database.allRecipes;
                        print(f);
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
