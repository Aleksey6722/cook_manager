import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/features/add/add.dart';
import 'package:cook_manager/features/add/bloc/image_box_bloc/image_box_bloc.dart';
import 'package:cook_manager/features/add/bloc/recipe_steps_bloc/recipe_steps_bloc.dart';
import 'package:cook_manager/features/add/bloc/structure_widget_bloc/structure_bloc.dart';

import 'package:cook_manager/features/main/bloc/category_bloc.dart';
import 'package:cook_manager/models/category.dart';

import 'package:cook_manager/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../router/router.dart';

@RoutePage()
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _addRecipeFormKey = GlobalKey<FormState>();
  String title = '',
      cookingTime = '',
      numberOfPortions = '',
      recipeUrl = '',
      category = '';
  String? description, proteins, carbohydrates, calories, fats;

  List<String> errors = [];

  String? titleErrorText,
      cookingTimeErrorText,
      portionsErrorText,
      categoryErrorText;

  final RecipeStepsBloc _recipeStepsBloc = GetIt.instance<RecipeStepsBloc>();
  final StructureBloc _structureBloc = GetIt.instance<StructureBloc>();
  final ImageBoxBloc _imageBoxBloc = GetIt.instance<ImageBoxBloc>();
  final CategoryBloc _categoryBloc = GetIt.instance<CategoryBloc>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController cookingTimeController = TextEditingController();
  final TextEditingController numOfPortionsController =
      TextEditingController(text: '4');
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController proteinsController = TextEditingController();
  final TextEditingController fatsController = TextEditingController();
  final TextEditingController carbohydratesController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  final DatabaseService db = DatabaseService.instance;

  @override
  void dispose() {
    titleController.dispose();
    cookingTimeController.dispose();
    numOfPortionsController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    proteinsController.dispose();
    fatsController.dispose();
    carbohydratesController.dispose();
    caloriesController.dispose();
    linkController.dispose();
    super.dispose();
  }

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
                      const ImageBox(),
                      const SizedBox(height: 15),
                      BaseFormField(
                        labelText: 'Название',
                        controller: titleController,
                        hintText: 'Рецепт малинового пирога',
                        validator: (val) {
                          if (val!.isEmpty) {
                            errors.add('название');
                            return '';
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
                        controller: cookingTimeController,
                        hintText: 'Часов',
                        onlyNumber: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            errors.add('время приготовления');
                            return '';
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
                        controller: numOfPortionsController,
                        onlyNumber: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            errors.add('количество порций');
                            return '';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          numberOfPortions = val!;
                        },
                      ),
                      const SizedBox(height: 10),
                      CategoryFormField(
                        categoryController: categoryController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            errors.add('категорию');
                            return '';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          category = val!;
                        },
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        controller: descriptionController,
                        labelText: 'Описание',
                        maxLines: 3,
                        onSaved: (val) {
                          description = val;
                        },
                      ),
                      const SizedBox(height: 10),
                      NutritionalValueWidget(
                        proteinsController: proteinsController,
                        fatsController: fatsController,
                        carbohydratesController: carbohydratesController,
                        caloriesController: caloriesController,
                        onSavedFats: (val) => fats = val,
                        onSavedProteins: (val) => proteins = val,
                        onSavedCarbo: (val) => carbohydrates = val,
                        onSavedCallories: (val) => calories = val,
                      ),
                      const SizedBox(height: 10),
                      BaseFormField(
                        labelText: 'Ссылка на источник',
                        controller: linkController,
                        hintText: 'https://',
                        onSaved: (val) {
                          recipeUrl = val ?? '';
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
                      const StructureWidget(),
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
                        await _createRecipe();
                        Future.delayed(const Duration(seconds: 1), _clearForm);
                      } else {
                        _showSnackBar();
                      }
                    },
                    child: const Text('Сохранить рецепт'),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void _showSnackBar() {
    String errorText = errors.join(', ');
    final snackBar = SnackBar(
      content: Text('Введите $errorText'),
      backgroundColor: const Color(0xFFa83434),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      )),
      action: SnackBarAction(
          label: 'OK',
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar),
    );
    errors = [];
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  int _getCategoryId(String name) {
    final List<Category> categories =
        (_categoryBloc.state as CategoryStateLoaded).listOfCategories;
    int id = 0;
    for (Category e in categories) {
      if (e.name == name) {
        id = e.id ?? 0;
      }
    }
    return id;
  }

  void _clearForm() {
    _imageBoxBloc.add(RemovePicture());
    titleController.clear();
    cookingTimeController.clear();
    numOfPortionsController.text = '4';
    categoryController.clear();
    descriptionController.clear();
    linkController.clear();
    proteinsController.clear();
    fatsController.clear();
    carbohydratesController.clear();
    caloriesController.clear();
    _recipeStepsBloc.add(GetInitSteps());
    _structureBloc.add(GetInitIngredients());
  }

  Future<void> _createRecipe() async {
    final Recipe recipe = Recipe(
      title: title,
      cookingTime: cookingTime,
      numberOfPortions: numberOfPortions,
      description: description,
      imageUrl: _imageBoxBloc.state.imageFile?.path,
      category: _getCategoryId(category),
      proteins: proteins,
      fats: fats,
      carbohydrates: carbohydrates,
      calories: calories,
      recipeUrl: recipeUrl,
      listOfIngredients: _structureBloc.state.listOfIngredients,
      listOfSteps: _recipeStepsBloc.state.listOfSteps,
    );
    final int id = await db.insertRecipe(recipe);
    context.router.push(RecipeRoute(recipeId: 68)); //68
  }
}
