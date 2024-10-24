import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

part 'database.g.dart';

class Recipe extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get cookingTime => text()();

  TextColumn get numberOfPortions => text()();

  IntColumn get category => integer().nullable().references(Category, #id)();

  TextColumn get description => text().nullable()();

  TextColumn get proteins => text().nullable()();

  TextColumn get fats => text().nullable()();

  TextColumn get carbohydrates => text().nullable()();

  TextColumn get calories => text().nullable()();

  TextColumn get recipeUrl => text().nullable()();

  TextColumn get listOfIngredients => text()();

  TextColumn get listOfSteps => text()();

  BoolColumn get isFavourite => boolean()();
}

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get imageUrl => text()();

  TextColumn get name => text()();
}

@singleton
@DriftDatabase(tables: [Recipe, Category])
class CookManagerDatabase extends _$CookManagerDatabase {
  CookManagerDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'database');
  }

  Future<void> insertAllCategories() async {
    await batch((batch) {
      batch.insertAll(category, [
        CategoryCompanion.insert(
          imageUrl: 'assets/images/salad.jpg',
          name: 'Салаты',
        ),
        CategoryCompanion.insert(
          imageUrl: 'assets/images/snaks.jpg',
          name: 'Закуски',
        ),
        CategoryCompanion.insert(
          imageUrl: 'assets/images/soup.jpg',
          name: 'Первые блюда',
        ),
        CategoryCompanion.insert(
          imageUrl: 'assets/images/main_dishes.jpg',
          name: 'Главные блюда',
        ),
        CategoryCompanion.insert(
          imageUrl: 'assets/images/desert.jpg',
          name: 'Десерты и выпечка',
        ),
        CategoryCompanion.insert(
          imageUrl: 'assets/images/drinks.jpg',
          name: 'Напитки',
        ),
      ]);
    });
  }

  Future<List<RecipeData>> get allRecipes => select(recipe).get();

  Future<List<CategoryData>> get allCategories => select(category).get();

  Future<List<RecipeData>> getRecipe(int id) {
    return (select(recipe)..where((a) => a.id.equals(id))).get();
  }

  Future<void>? clearAllTables() {
    delete(recipe).go();
    delete(category).go();
  }

  Future<int> insertRecipe (RecipeCompanion entry) {
    return into(recipe).insert(entry);
  }


// static QueryExecutor _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase.createInBackground(file);
//   });
// }
}
