import 'dart:convert';

import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final String _recipeTableName = 'recipe';
  final String _recipeIdColumnName = 'id';
  final String _recipeTitleColumnName = 'title';
  final String _recipeCookingTimeColumnName = 'cooking_time';
  final String _recipeNumberOfPortionsColumnName = 'number_of_portions';
  final String _recipeCategoryIdColumnName = 'category';
  final String _recipeDescriptionColumnName = 'description';
  final String _recipeImageUrlColumnName = 'image_url';
  final String _recipeProteinsColumnName = 'proteins';
  final String _recipeFatsColumnName = 'fats';
  final String _recipeCarbohydratesColumnName = 'carbohydrates';
  final String _recipeCaloriesColumnName = 'calories';
  final String _recipeRecipeUrlColumnName = 'recipeUrl';
  final String _recipeIngredientsColumnName = 'list_of_ingredients';
  final String _recipeStepsColumnName = 'list_of_steps';
  final String _recipeIsFavouriteColumnName = 'is_favourite';

  final String _categoryTableName = 'category';
  final String _categoryIdColumnName = 'id';
  final String _categoryImageUrlColumnName = 'image_url';
  final String _categoryNameColumnName = 'name';

  static Database? _db;

  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'cook_database');
    final database = await openDatabase(
      version: 1,
      databasePath,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_recipeTableName (
         $_recipeIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
         $_recipeTitleColumnName TEXT NOT NULL,
         $_recipeCookingTimeColumnName TEXT NOT NULL,
         $_recipeNumberOfPortionsColumnName TEXT NOT NULL,
         $_recipeCategoryIdColumnName INTEGER,
         $_recipeDescriptionColumnName TEXT,
         $_recipeImageUrlColumnName TEXT,
         $_recipeProteinsColumnName TEXT,
         $_recipeFatsColumnName TEXT,
         $_recipeCarbohydratesColumnName TEXT,
         $_recipeCaloriesColumnName TEXT,
         $_recipeRecipeUrlColumnName TEXT,
         $_recipeIngredientsColumnName TEXT NOT NULL,
         $_recipeStepsColumnName TEXT NOT NULL,
         $_recipeIsFavouriteColumnName INTEGER DEFAULT 0,
         FOREIGN KEY($_recipeCategoryIdColumnName) REFERENCES $_categoryTableName($_categoryIdColumnName) 
        );  
        ''');
        await db.execute('''
        CREATE TABLE $_categoryTableName (
         $_categoryIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
         $_categoryImageUrlColumnName TEXT NOT NULL,
         $_categoryNameColumnName TEXT NOT NULL
        );
        ''');
        await db.execute('''
        INSERT INTO $_categoryTableName ($_categoryImageUrlColumnName, $_categoryNameColumnName) 
        VALUES ('assets/images/salad.jpg', 'Салаты'),
               ('assets/images/snaks.jpg', 'Закуски'),  
               ('assets/images/soup.jpg', 'Первые блюда'),  
               ('assets/images/main_dishes.jpg', 'Главные блюда'),  
               ('assets/images/desert.jpg', 'Десерты и выпечка'),  
               ('assets/images/drinks.jpg', 'Напитки');
        ''');
      },
    );
    return database;
  }

  void addRecipe(Recipe recipe) async {
    final db = await database;
    await db.insert(_recipeTableName, recipe.toJson());
  }

  Future<void> deleteDB() async {
    final path = await getDatabasesPath();
    await deleteDatabase(join(path, 'cook_database'));
  }

  Future<List<Map<String, Object?>>> showData() async {
    final db = await database;
    final result = await db.query(_recipeTableName);
    return result;
  }

  Future<int> insertRecipe(Recipe recipe) async {
    final db = await database;
    return db.rawInsert(
        '''INSERT INTO $_recipeTableName($_recipeTitleColumnName, $_recipeCookingTimeColumnName, $_recipeNumberOfPortionsColumnName, $_recipeCategoryIdColumnName, $_recipeDescriptionColumnName, $_recipeImageUrlColumnName, $_recipeProteinsColumnName, $_recipeFatsColumnName, $_recipeCarbohydratesColumnName, $_recipeCaloriesColumnName, $_recipeRecipeUrlColumnName, $_recipeIngredientsColumnName, $_recipeStepsColumnName, $_recipeIsFavouriteColumnName) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          recipe.title,
          recipe.cookingTime,
          recipe.numberOfPortions,
          recipe.category,
          recipe.description,
          recipe.imageUrl,
          recipe.proteins,
          recipe.fats,
          recipe.carbohydrates,
          recipe.calories,
          recipe.recipeUrl,
          jsonEncode(recipe.toJson()['list_of_ingredients']),
          jsonEncode(recipe.toJson()['list_of_steps']),
          recipe.isFavourite,
        ]);
  }

  Future<Recipe> getRecipe(int id) async {
    final db = await database;
    final raw =
        await db.query(_recipeTableName, where: 'id = ?', whereArgs: [id]);
    final json = jsonDecode(jsonEncode(raw[0]));
    final listOfSteps = jsonDecode(
        jsonDecode(jsonEncode(raw[0]['list_of_steps']))); // obtain List<Object>
    final listOfIngredients = jsonDecode(jsonDecode(
        jsonEncode(raw[0]['list_of_ingredients']))); // obtain List<Object>
    json['list_of_steps'] = listOfSteps;
    json['list_of_ingredients'] = listOfIngredients;
    json['is_favourite'] = json['is_favourite'] == 1;
    final Recipe recipeFromDB = Recipe.fromJson(json);
    return recipeFromDB;
  }

  Future<List<Category>> getCategories() async {
    final db = await database;
    final result = await db.query(_categoryTableName);
    final list = result.map((e) {
      final cat = Category.fromJson(e);
      return cat;
    }).toList();
    return list;
  }
}
