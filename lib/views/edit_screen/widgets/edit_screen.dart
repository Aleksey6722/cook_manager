import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/data/data_repository.dart';
import 'package:cook_manager/domain/edit_recipe/structure_widget_bloc/structure_bloc.dart';
import 'package:cook_manager/domain/edit_recipe/image_box_bloc/image_box_bloc.dart';
import 'package:cook_manager/domain/edit_recipe/recipe_steps_bloc/recipe_steps_bloc.dart';
import 'package:cook_manager/domain/home_screen/category_bloc.dart';
import 'package:cook_manager/domain/settings/settings_cubit.dart';
import 'package:cook_manager/generated/l10n.dart';
import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
import 'package:cook_manager/views/edit_screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    this.recipe,
    this.listScreenCategoryId,
    this.isFromAllCategoryList = false,
    this.isFromSearchScreen = false,
  });

  final Recipe? recipe;
  final int? listScreenCategoryId;
  final bool isFromAllCategoryList;
  final bool isFromSearchScreen;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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

  final SettingsCubit _settingsCubit = GetIt.instance<SettingsCubit>();

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

  final DataRepository db = GetIt.instance<DataRepository>();

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
  void initState() {
    if (widget.recipe != null) {
      _fillFormForEditing();
      super.initState();
    } else {
      _structureBloc.add(GetInitIngredients());
      _recipeStepsBloc.add(GetInitSteps());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (widget.recipe != null) {
          _clearForm();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.recipe == null ? S.of(context).add_recipe : S.of(context).edit_recipe,
            style: theme.textTheme.headlineSmall,
          ),
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
                          labelText: S.of(context).recipe_name,
                          controller: titleController,
                          hintText: S.of(context).recipe_name_placeholder,
                          validator: (val) {
                            if (val!.isEmpty) {
                              errors.add(S.of(context).recipe_name.toLowerCase());
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
                          labelText: S.of(context).cooking_time,
                          controller: cookingTimeController,
                          hintText: S.of(context).hours,
                          onlyNumber: true,
                          validator: (val) {
                            if (val!.isEmpty) {
                              errors.add(S.of(context).cooking_time.toLowerCase());
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
                          labelText: S.of(context).number_of_servings,
                          controller: numOfPortionsController,
                          onlyNumber: true,
                          validator: (val) {
                            if (val!.isEmpty) {
                              errors.add(S.of(context).number_of_servings.toLowerCase());
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
                              errors.add(S.of(context).category_1);
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
                          labelText: S.of(context).description,
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
                          labelText: S.of(context).source_link,
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
                              S.of(context).ingredients,
                              style: theme.textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const StructureWidget(),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              S.of(context).method,
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
                          widget.recipe == null
                              ? await _addRecipe()
                              : await _updateRecipe();
                        } else {
                          _showSnackBar();
                        }
                      },
                      child: Text(S.of(context).save_recipe),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _showSnackBar() {
    String errorText = errors.join(', ');
    final snackBar = SnackBar(
      content: Text('${S.of(context).enter} $errorText'),
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
    final List<String> categoriesNames = [
      S.of(context).salads,
      S.of(context).snacks,
      S.of(context).soups,
      S.of(context).main_course,
      S.of(context).desserts,
      S.of(context).drinks
    ];

    if(Localizations.localeOf(context).toString() == 'en'){
      return categoriesNames.indexOf(name)+1;
    }

    int id = 0;
    for (Category e in categories) {
      if (e.name == name) {
        id = e.id ?? 0;
      }
    }
    return id;
  }

  String _getCategoryName(int id) {
    final List<Category> categories =
        (_categoryBloc.state as CategoryStateLoaded).listOfCategories;
    final List<String> categoriesNames = [
      S.of(context).salads,
      S.of(context).snacks,
      S.of(context).soups,
      S.of(context).main_course,
      S.of(context).desserts,
      S.of(context).drinks
    ];

    if(Localizations.localeOf(context).toString() == 'en'){
      return categoriesNames[id];
    }

    String name = '';
    for (Category e in categories) {
      if (e.id == id) {
        name = e.name;
      }
    }
    return name;
  }

  void _fillFormForEditing() {
    if (widget.recipe!.imageUrl != null) {
      _imageBoxBloc.add(SetEditingPicture(path: widget.recipe!.imageUrl!));
    }
    _structureBloc.add(EditIngredientsEvent(
        editingList: widget.recipe!.listOfIngredients.toList()));
    _recipeStepsBloc.add(EditingStepsEvent(
        editingStepsList: widget.recipe!.listOfSteps.toList()));
    titleController.text = widget.recipe!.title;
    cookingTimeController.text = widget.recipe!.cookingTime;
    numOfPortionsController.text = widget.recipe!.numberOfPortions;
    categoryController.text = _getCategoryName(widget.recipe!.category);
    descriptionController.text = widget.recipe!.description ?? '';
    proteinsController.text = widget.recipe!.proteins ?? '';
    fatsController.text = widget.recipe!.fats ?? '';
    carbohydratesController.text = widget.recipe!.carbohydrates ?? '';
    caloriesController.text = widget.recipe!.calories ?? '';
    linkController.text = widget.recipe!.recipeUrl ?? '';
  }

  void _clearForm() {
    _recipeStepsBloc.add(GetInitSteps());
    _structureBloc.add(GetInitIngredients());
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
  }

  Future<void> _addRecipe() async {
    Recipe recipe = _createRecipe();
    final int id = await db.insertRecipe(recipe);
    _settingsCubit.changeAmountOfRecipes();
    context.router.push(RecipeRoute(
      // recipe: recipe.copyWith(id: id),
      recipeId: id,
    ));
    Future.delayed(const Duration(seconds: 1), _clearForm);
  }

  Future<void> _updateRecipe() async {
    Recipe recipe = _createRecipe();
    final bool didUpdate = await db.updateRecipe(widget.recipe!.rowid!, recipe);
    if (didUpdate) {
      context.router.pushAndPopUntil(
        RecipeRoute(
          recipeId: widget.recipe!.rowid!,
          isFromAllCategoryScreen: widget.isFromAllCategoryList,
          categoryIdFromListScreen: widget.listScreenCategoryId,
          isFromSearchScreen : widget.isFromSearchScreen,
        ),
        predicate: (rout) => rout.isFirst,
      );
    }
  }

  Recipe _createRecipe() {
    final Recipe recipe = Recipe(
      rowid: widget.recipe?.rowid,
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
      isFavourite: widget.recipe?.isFavourite ?? false,
    );
    return recipe;
  }
}
