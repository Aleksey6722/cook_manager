import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/models/category.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:injectable/injectable.dart';

@injectable
class DataRepository {
  final DatabaseService _db;

  DataRepository(DatabaseService db) : _db = db;

  Future<bool> updateRecipe(int id, Recipe recipe) async {
    return _db.updateRecipe(id, recipe);
  }

  Future<Recipe> getRecipe(int id) async {
    return _db.getRecipe(id);
  }

  Future<void> deleteRecipe(int id) async {
    _db.deleteRecipe(id);
  }

  Future<List<Recipe>> getFavouriteRecipes() async {
    return _db.getFavouriteRecipes();
  }

  Future<List<Category>> getCategories() async {
    return _db.getCategories();
  }

  Future<List<Recipe>> getAllRecipes() async {
    return _db.getAllRecipes();
  }

  Future<List<Recipe>> getRecipesByCategoryId(int categoryId) async {
    return _db.getRecipesByCategoryId(categoryId);
  }

  Future<int> insertRecipe(Recipe recipe) async {
    return _db.insertRecipe(recipe);
  }

  Future<List<Recipe>> findText(String text) async {
    return _db.findText(text);
  }

}
