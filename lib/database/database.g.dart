// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imageUrl, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String imageUrl;
  final String name;
  const CategoryData(
      {required this.id, required this.imageUrl, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      name: Value(name),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryData copyWith({int? id, String? imageUrl, String? name}) =>
      CategoryData(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        name: name ?? this.name,
      );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageUrl, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.name == this.name);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> imageUrl;
  final Value<String> name;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String imageUrl,
    required String name,
  })  : imageUrl = Value(imageUrl),
        name = Value(name);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? imageUrl,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (name != null) 'name': name,
    });
  }

  CategoryCompanion copyWith(
      {Value<int>? id, Value<String>? imageUrl, Value<String>? name}) {
    return CategoryCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RecipeTable extends Recipe with TableInfo<$RecipeTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cookingTimeMeta =
      const VerificationMeta('cookingTime');
  @override
  late final GeneratedColumn<String> cookingTime = GeneratedColumn<String>(
      'cooking_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberOfPortionsMeta =
      const VerificationMeta('numberOfPortions');
  @override
  late final GeneratedColumn<String> numberOfPortions = GeneratedColumn<String>(
      'number_of_portions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _proteinsMeta =
      const VerificationMeta('proteins');
  @override
  late final GeneratedColumn<String> proteins = GeneratedColumn<String>(
      'proteins', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatsMeta = const VerificationMeta('fats');
  @override
  late final GeneratedColumn<String> fats = GeneratedColumn<String>(
      'fats', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _carbohydratesMeta =
      const VerificationMeta('carbohydrates');
  @override
  late final GeneratedColumn<String> carbohydrates = GeneratedColumn<String>(
      'carbohydrates', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<String> calories = GeneratedColumn<String>(
      'calories', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recipeUrlMeta =
      const VerificationMeta('recipeUrl');
  @override
  late final GeneratedColumn<String> recipeUrl = GeneratedColumn<String>(
      'recipe_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _listOfIngredientsMeta =
      const VerificationMeta('listOfIngredients');
  @override
  late final GeneratedColumn<String> listOfIngredients =
      GeneratedColumn<String>('list_of_ingredients', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _listOfStepsMeta =
      const VerificationMeta('listOfSteps');
  @override
  late final GeneratedColumn<String> listOfSteps = GeneratedColumn<String>(
      'list_of_steps', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'is_favourite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favourite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        cookingTime,
        numberOfPortions,
        category,
        description,
        proteins,
        fats,
        carbohydrates,
        calories,
        recipeUrl,
        listOfIngredients,
        listOfSteps,
        isFavourite
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('cooking_time')) {
      context.handle(
          _cookingTimeMeta,
          cookingTime.isAcceptableOrUnknown(
              data['cooking_time']!, _cookingTimeMeta));
    } else if (isInserting) {
      context.missing(_cookingTimeMeta);
    }
    if (data.containsKey('number_of_portions')) {
      context.handle(
          _numberOfPortionsMeta,
          numberOfPortions.isAcceptableOrUnknown(
              data['number_of_portions']!, _numberOfPortionsMeta));
    } else if (isInserting) {
      context.missing(_numberOfPortionsMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('proteins')) {
      context.handle(_proteinsMeta,
          proteins.isAcceptableOrUnknown(data['proteins']!, _proteinsMeta));
    }
    if (data.containsKey('fats')) {
      context.handle(
          _fatsMeta, fats.isAcceptableOrUnknown(data['fats']!, _fatsMeta));
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
          _carbohydratesMeta,
          carbohydrates.isAcceptableOrUnknown(
              data['carbohydrates']!, _carbohydratesMeta));
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    }
    if (data.containsKey('recipe_url')) {
      context.handle(_recipeUrlMeta,
          recipeUrl.isAcceptableOrUnknown(data['recipe_url']!, _recipeUrlMeta));
    }
    if (data.containsKey('list_of_ingredients')) {
      context.handle(
          _listOfIngredientsMeta,
          listOfIngredients.isAcceptableOrUnknown(
              data['list_of_ingredients']!, _listOfIngredientsMeta));
    } else if (isInserting) {
      context.missing(_listOfIngredientsMeta);
    }
    if (data.containsKey('list_of_steps')) {
      context.handle(
          _listOfStepsMeta,
          listOfSteps.isAcceptableOrUnknown(
              data['list_of_steps']!, _listOfStepsMeta));
    } else if (isInserting) {
      context.missing(_listOfStepsMeta);
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['is_favourite']!, _isFavouriteMeta));
    } else if (isInserting) {
      context.missing(_isFavouriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      cookingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cooking_time'])!,
      numberOfPortions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}number_of_portions'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      proteins: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}proteins']),
      fats: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fats']),
      carbohydrates: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}carbohydrates']),
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}calories']),
      recipeUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_url']),
      listOfIngredients: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}list_of_ingredients'])!,
      listOfSteps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}list_of_steps'])!,
      isFavourite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favourite'])!,
    );
  }

  @override
  $RecipeTable createAlias(String alias) {
    return $RecipeTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final int id;
  final String title;
  final String cookingTime;
  final String numberOfPortions;
  final int? category;
  final String? description;
  final String? proteins;
  final String? fats;
  final String? carbohydrates;
  final String? calories;
  final String? recipeUrl;
  final String listOfIngredients;
  final String listOfSteps;
  final bool isFavourite;
  const RecipeData(
      {required this.id,
      required this.title,
      required this.cookingTime,
      required this.numberOfPortions,
      this.category,
      this.description,
      this.proteins,
      this.fats,
      this.carbohydrates,
      this.calories,
      this.recipeUrl,
      required this.listOfIngredients,
      required this.listOfSteps,
      required this.isFavourite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['cooking_time'] = Variable<String>(cookingTime);
    map['number_of_portions'] = Variable<String>(numberOfPortions);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || proteins != null) {
      map['proteins'] = Variable<String>(proteins);
    }
    if (!nullToAbsent || fats != null) {
      map['fats'] = Variable<String>(fats);
    }
    if (!nullToAbsent || carbohydrates != null) {
      map['carbohydrates'] = Variable<String>(carbohydrates);
    }
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<String>(calories);
    }
    if (!nullToAbsent || recipeUrl != null) {
      map['recipe_url'] = Variable<String>(recipeUrl);
    }
    map['list_of_ingredients'] = Variable<String>(listOfIngredients);
    map['list_of_steps'] = Variable<String>(listOfSteps);
    map['is_favourite'] = Variable<bool>(isFavourite);
    return map;
  }

  RecipeCompanion toCompanion(bool nullToAbsent) {
    return RecipeCompanion(
      id: Value(id),
      title: Value(title),
      cookingTime: Value(cookingTime),
      numberOfPortions: Value(numberOfPortions),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      proteins: proteins == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins),
      fats: fats == null && nullToAbsent ? const Value.absent() : Value(fats),
      carbohydrates: carbohydrates == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      recipeUrl: recipeUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(recipeUrl),
      listOfIngredients: Value(listOfIngredients),
      listOfSteps: Value(listOfSteps),
      isFavourite: Value(isFavourite),
    );
  }

  factory RecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      cookingTime: serializer.fromJson<String>(json['cookingTime']),
      numberOfPortions: serializer.fromJson<String>(json['numberOfPortions']),
      category: serializer.fromJson<int?>(json['category']),
      description: serializer.fromJson<String?>(json['description']),
      proteins: serializer.fromJson<String?>(json['proteins']),
      fats: serializer.fromJson<String?>(json['fats']),
      carbohydrates: serializer.fromJson<String?>(json['carbohydrates']),
      calories: serializer.fromJson<String?>(json['calories']),
      recipeUrl: serializer.fromJson<String?>(json['recipeUrl']),
      listOfIngredients: serializer.fromJson<String>(json['listOfIngredients']),
      listOfSteps: serializer.fromJson<String>(json['listOfSteps']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'cookingTime': serializer.toJson<String>(cookingTime),
      'numberOfPortions': serializer.toJson<String>(numberOfPortions),
      'category': serializer.toJson<int?>(category),
      'description': serializer.toJson<String?>(description),
      'proteins': serializer.toJson<String?>(proteins),
      'fats': serializer.toJson<String?>(fats),
      'carbohydrates': serializer.toJson<String?>(carbohydrates),
      'calories': serializer.toJson<String?>(calories),
      'recipeUrl': serializer.toJson<String?>(recipeUrl),
      'listOfIngredients': serializer.toJson<String>(listOfIngredients),
      'listOfSteps': serializer.toJson<String>(listOfSteps),
      'isFavourite': serializer.toJson<bool>(isFavourite),
    };
  }

  RecipeData copyWith(
          {int? id,
          String? title,
          String? cookingTime,
          String? numberOfPortions,
          Value<int?> category = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> proteins = const Value.absent(),
          Value<String?> fats = const Value.absent(),
          Value<String?> carbohydrates = const Value.absent(),
          Value<String?> calories = const Value.absent(),
          Value<String?> recipeUrl = const Value.absent(),
          String? listOfIngredients,
          String? listOfSteps,
          bool? isFavourite}) =>
      RecipeData(
        id: id ?? this.id,
        title: title ?? this.title,
        cookingTime: cookingTime ?? this.cookingTime,
        numberOfPortions: numberOfPortions ?? this.numberOfPortions,
        category: category.present ? category.value : this.category,
        description: description.present ? description.value : this.description,
        proteins: proteins.present ? proteins.value : this.proteins,
        fats: fats.present ? fats.value : this.fats,
        carbohydrates:
            carbohydrates.present ? carbohydrates.value : this.carbohydrates,
        calories: calories.present ? calories.value : this.calories,
        recipeUrl: recipeUrl.present ? recipeUrl.value : this.recipeUrl,
        listOfIngredients: listOfIngredients ?? this.listOfIngredients,
        listOfSteps: listOfSteps ?? this.listOfSteps,
        isFavourite: isFavourite ?? this.isFavourite,
      );
  RecipeData copyWithCompanion(RecipeCompanion data) {
    return RecipeData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      cookingTime:
          data.cookingTime.present ? data.cookingTime.value : this.cookingTime,
      numberOfPortions: data.numberOfPortions.present
          ? data.numberOfPortions.value
          : this.numberOfPortions,
      category: data.category.present ? data.category.value : this.category,
      description:
          data.description.present ? data.description.value : this.description,
      proteins: data.proteins.present ? data.proteins.value : this.proteins,
      fats: data.fats.present ? data.fats.value : this.fats,
      carbohydrates: data.carbohydrates.present
          ? data.carbohydrates.value
          : this.carbohydrates,
      calories: data.calories.present ? data.calories.value : this.calories,
      recipeUrl: data.recipeUrl.present ? data.recipeUrl.value : this.recipeUrl,
      listOfIngredients: data.listOfIngredients.present
          ? data.listOfIngredients.value
          : this.listOfIngredients,
      listOfSteps:
          data.listOfSteps.present ? data.listOfSteps.value : this.listOfSteps,
      isFavourite:
          data.isFavourite.present ? data.isFavourite.value : this.isFavourite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('numberOfPortions: $numberOfPortions, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('proteins: $proteins, ')
          ..write('fats: $fats, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('calories: $calories, ')
          ..write('recipeUrl: $recipeUrl, ')
          ..write('listOfIngredients: $listOfIngredients, ')
          ..write('listOfSteps: $listOfSteps, ')
          ..write('isFavourite: $isFavourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      cookingTime,
      numberOfPortions,
      category,
      description,
      proteins,
      fats,
      carbohydrates,
      calories,
      recipeUrl,
      listOfIngredients,
      listOfSteps,
      isFavourite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData &&
          other.id == this.id &&
          other.title == this.title &&
          other.cookingTime == this.cookingTime &&
          other.numberOfPortions == this.numberOfPortions &&
          other.category == this.category &&
          other.description == this.description &&
          other.proteins == this.proteins &&
          other.fats == this.fats &&
          other.carbohydrates == this.carbohydrates &&
          other.calories == this.calories &&
          other.recipeUrl == this.recipeUrl &&
          other.listOfIngredients == this.listOfIngredients &&
          other.listOfSteps == this.listOfSteps &&
          other.isFavourite == this.isFavourite);
}

class RecipeCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> cookingTime;
  final Value<String> numberOfPortions;
  final Value<int?> category;
  final Value<String?> description;
  final Value<String?> proteins;
  final Value<String?> fats;
  final Value<String?> carbohydrates;
  final Value<String?> calories;
  final Value<String?> recipeUrl;
  final Value<String> listOfIngredients;
  final Value<String> listOfSteps;
  final Value<bool> isFavourite;
  const RecipeCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.numberOfPortions = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.proteins = const Value.absent(),
    this.fats = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.calories = const Value.absent(),
    this.recipeUrl = const Value.absent(),
    this.listOfIngredients = const Value.absent(),
    this.listOfSteps = const Value.absent(),
    this.isFavourite = const Value.absent(),
  });
  RecipeCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String cookingTime,
    required String numberOfPortions,
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.proteins = const Value.absent(),
    this.fats = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.calories = const Value.absent(),
    this.recipeUrl = const Value.absent(),
    required String listOfIngredients,
    required String listOfSteps,
    required bool isFavourite,
  })  : title = Value(title),
        cookingTime = Value(cookingTime),
        numberOfPortions = Value(numberOfPortions),
        listOfIngredients = Value(listOfIngredients),
        listOfSteps = Value(listOfSteps),
        isFavourite = Value(isFavourite);
  static Insertable<RecipeData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? cookingTime,
    Expression<String>? numberOfPortions,
    Expression<int>? category,
    Expression<String>? description,
    Expression<String>? proteins,
    Expression<String>? fats,
    Expression<String>? carbohydrates,
    Expression<String>? calories,
    Expression<String>? recipeUrl,
    Expression<String>? listOfIngredients,
    Expression<String>? listOfSteps,
    Expression<bool>? isFavourite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (cookingTime != null) 'cooking_time': cookingTime,
      if (numberOfPortions != null) 'number_of_portions': numberOfPortions,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (proteins != null) 'proteins': proteins,
      if (fats != null) 'fats': fats,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (calories != null) 'calories': calories,
      if (recipeUrl != null) 'recipe_url': recipeUrl,
      if (listOfIngredients != null) 'list_of_ingredients': listOfIngredients,
      if (listOfSteps != null) 'list_of_steps': listOfSteps,
      if (isFavourite != null) 'is_favourite': isFavourite,
    });
  }

  RecipeCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? cookingTime,
      Value<String>? numberOfPortions,
      Value<int?>? category,
      Value<String?>? description,
      Value<String?>? proteins,
      Value<String?>? fats,
      Value<String?>? carbohydrates,
      Value<String?>? calories,
      Value<String?>? recipeUrl,
      Value<String>? listOfIngredients,
      Value<String>? listOfSteps,
      Value<bool>? isFavourite}) {
    return RecipeCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      cookingTime: cookingTime ?? this.cookingTime,
      numberOfPortions: numberOfPortions ?? this.numberOfPortions,
      category: category ?? this.category,
      description: description ?? this.description,
      proteins: proteins ?? this.proteins,
      fats: fats ?? this.fats,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      calories: calories ?? this.calories,
      recipeUrl: recipeUrl ?? this.recipeUrl,
      listOfIngredients: listOfIngredients ?? this.listOfIngredients,
      listOfSteps: listOfSteps ?? this.listOfSteps,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (cookingTime.present) {
      map['cooking_time'] = Variable<String>(cookingTime.value);
    }
    if (numberOfPortions.present) {
      map['number_of_portions'] = Variable<String>(numberOfPortions.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (proteins.present) {
      map['proteins'] = Variable<String>(proteins.value);
    }
    if (fats.present) {
      map['fats'] = Variable<String>(fats.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<String>(carbohydrates.value);
    }
    if (calories.present) {
      map['calories'] = Variable<String>(calories.value);
    }
    if (recipeUrl.present) {
      map['recipe_url'] = Variable<String>(recipeUrl.value);
    }
    if (listOfIngredients.present) {
      map['list_of_ingredients'] = Variable<String>(listOfIngredients.value);
    }
    if (listOfSteps.present) {
      map['list_of_steps'] = Variable<String>(listOfSteps.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('numberOfPortions: $numberOfPortions, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('proteins: $proteins, ')
          ..write('fats: $fats, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('calories: $calories, ')
          ..write('recipeUrl: $recipeUrl, ')
          ..write('listOfIngredients: $listOfIngredients, ')
          ..write('listOfSteps: $listOfSteps, ')
          ..write('isFavourite: $isFavourite')
          ..write(')'))
        .toString();
  }
}

abstract class _$CookManagerDatabase extends GeneratedDatabase {
  _$CookManagerDatabase(QueryExecutor e) : super(e);
  $CookManagerDatabaseManager get managers => $CookManagerDatabaseManager(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $RecipeTable recipe = $RecipeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [category, recipe];
}

typedef $$CategoryTableCreateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  required String imageUrl,
  required String name,
});
typedef $$CategoryTableUpdateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  Value<String> imageUrl,
  Value<String> name,
});

final class $$CategoryTableReferences extends BaseReferences<
    _$CookManagerDatabase, $CategoryTable, CategoryData> {
  $$CategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeTable, List<RecipeData>> _recipeRefsTable(
          _$CookManagerDatabase db) =>
      MultiTypedResultKey.fromTable(db.recipe,
          aliasName: $_aliasNameGenerator(db.category.id, db.recipe.category));

  $$RecipeTableProcessedTableManager get recipeRefs {
    final manager = $$RecipeTableTableManager($_db, $_db.recipe)
        .filter((f) => f.category.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_recipeRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoryTableFilterComposer
    extends Composer<_$CookManagerDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> recipeRefs(
      Expression<bool> Function($$RecipeTableFilterComposer f) f) {
    final $$RecipeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipe,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableFilterComposer(
              $db: $db,
              $table: $db.recipe,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryTableOrderingComposer
    extends Composer<_$CookManagerDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$CookManagerDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> recipeRefs<T extends Object>(
      Expression<T> Function($$RecipeTableAnnotationComposer a) f) {
    final $$RecipeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipe,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableAnnotationComposer(
              $db: $db,
              $table: $db.recipe,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryTableTableManager extends RootTableManager<
    _$CookManagerDatabase,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, $$CategoryTableReferences),
    CategoryData,
    PrefetchHooks Function({bool recipeRefs})> {
  $$CategoryTableTableManager(_$CookManagerDatabase db, $CategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              CategoryCompanion(
            id: id,
            imageUrl: imageUrl,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String imageUrl,
            required String name,
          }) =>
              CategoryCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CategoryTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({recipeRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (recipeRefs) db.recipe],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CategoryTableReferences._recipeRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoryTableReferences(db, table, p0).recipeRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoryTableProcessedTableManager = ProcessedTableManager<
    _$CookManagerDatabase,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, $$CategoryTableReferences),
    CategoryData,
    PrefetchHooks Function({bool recipeRefs})>;
typedef $$RecipeTableCreateCompanionBuilder = RecipeCompanion Function({
  Value<int> id,
  required String title,
  required String cookingTime,
  required String numberOfPortions,
  Value<int?> category,
  Value<String?> description,
  Value<String?> proteins,
  Value<String?> fats,
  Value<String?> carbohydrates,
  Value<String?> calories,
  Value<String?> recipeUrl,
  required String listOfIngredients,
  required String listOfSteps,
  required bool isFavourite,
});
typedef $$RecipeTableUpdateCompanionBuilder = RecipeCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> cookingTime,
  Value<String> numberOfPortions,
  Value<int?> category,
  Value<String?> description,
  Value<String?> proteins,
  Value<String?> fats,
  Value<String?> carbohydrates,
  Value<String?> calories,
  Value<String?> recipeUrl,
  Value<String> listOfIngredients,
  Value<String> listOfSteps,
  Value<bool> isFavourite,
});

final class $$RecipeTableReferences
    extends BaseReferences<_$CookManagerDatabase, $RecipeTable, RecipeData> {
  $$RecipeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTable _categoryTable(_$CookManagerDatabase db) => db.category
      .createAlias($_aliasNameGenerator(db.recipe.category, db.category.id));

  $$CategoryTableProcessedTableManager? get category {
    if ($_item.category == null) return null;
    final manager = $$CategoryTableTableManager($_db, $_db.category)
        .filter((f) => f.id($_item.category!));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RecipeTableFilterComposer
    extends Composer<_$CookManagerDatabase, $RecipeTable> {
  $$RecipeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cookingTime => $composableBuilder(
      column: $table.cookingTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get numberOfPortions => $composableBuilder(
      column: $table.numberOfPortions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get proteins => $composableBuilder(
      column: $table.proteins, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fats => $composableBuilder(
      column: $table.fats, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get carbohydrates => $composableBuilder(
      column: $table.carbohydrates, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recipeUrl => $composableBuilder(
      column: $table.recipeUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get listOfIngredients => $composableBuilder(
      column: $table.listOfIngredients,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get listOfSteps => $composableBuilder(
      column: $table.listOfSteps, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));

  $$CategoryTableFilterComposer get category {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableFilterComposer(
              $db: $db,
              $table: $db.category,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeTableOrderingComposer
    extends Composer<_$CookManagerDatabase, $RecipeTable> {
  $$RecipeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cookingTime => $composableBuilder(
      column: $table.cookingTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get numberOfPortions => $composableBuilder(
      column: $table.numberOfPortions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get proteins => $composableBuilder(
      column: $table.proteins, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fats => $composableBuilder(
      column: $table.fats, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get carbohydrates => $composableBuilder(
      column: $table.carbohydrates,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recipeUrl => $composableBuilder(
      column: $table.recipeUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get listOfIngredients => $composableBuilder(
      column: $table.listOfIngredients,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get listOfSteps => $composableBuilder(
      column: $table.listOfSteps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));

  $$CategoryTableOrderingComposer get category {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableOrderingComposer(
              $db: $db,
              $table: $db.category,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeTableAnnotationComposer
    extends Composer<_$CookManagerDatabase, $RecipeTable> {
  $$RecipeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get cookingTime => $composableBuilder(
      column: $table.cookingTime, builder: (column) => column);

  GeneratedColumn<String> get numberOfPortions => $composableBuilder(
      column: $table.numberOfPortions, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get proteins =>
      $composableBuilder(column: $table.proteins, builder: (column) => column);

  GeneratedColumn<String> get fats =>
      $composableBuilder(column: $table.fats, builder: (column) => column);

  GeneratedColumn<String> get carbohydrates => $composableBuilder(
      column: $table.carbohydrates, builder: (column) => column);

  GeneratedColumn<String> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<String> get recipeUrl =>
      $composableBuilder(column: $table.recipeUrl, builder: (column) => column);

  GeneratedColumn<String> get listOfIngredients => $composableBuilder(
      column: $table.listOfIngredients, builder: (column) => column);

  GeneratedColumn<String> get listOfSteps => $composableBuilder(
      column: $table.listOfSteps, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);

  $$CategoryTableAnnotationComposer get category {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableAnnotationComposer(
              $db: $db,
              $table: $db.category,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeTableTableManager extends RootTableManager<
    _$CookManagerDatabase,
    $RecipeTable,
    RecipeData,
    $$RecipeTableFilterComposer,
    $$RecipeTableOrderingComposer,
    $$RecipeTableAnnotationComposer,
    $$RecipeTableCreateCompanionBuilder,
    $$RecipeTableUpdateCompanionBuilder,
    (RecipeData, $$RecipeTableReferences),
    RecipeData,
    PrefetchHooks Function({bool category})> {
  $$RecipeTableTableManager(_$CookManagerDatabase db, $RecipeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> cookingTime = const Value.absent(),
            Value<String> numberOfPortions = const Value.absent(),
            Value<int?> category = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> proteins = const Value.absent(),
            Value<String?> fats = const Value.absent(),
            Value<String?> carbohydrates = const Value.absent(),
            Value<String?> calories = const Value.absent(),
            Value<String?> recipeUrl = const Value.absent(),
            Value<String> listOfIngredients = const Value.absent(),
            Value<String> listOfSteps = const Value.absent(),
            Value<bool> isFavourite = const Value.absent(),
          }) =>
              RecipeCompanion(
            id: id,
            title: title,
            cookingTime: cookingTime,
            numberOfPortions: numberOfPortions,
            category: category,
            description: description,
            proteins: proteins,
            fats: fats,
            carbohydrates: carbohydrates,
            calories: calories,
            recipeUrl: recipeUrl,
            listOfIngredients: listOfIngredients,
            listOfSteps: listOfSteps,
            isFavourite: isFavourite,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String cookingTime,
            required String numberOfPortions,
            Value<int?> category = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> proteins = const Value.absent(),
            Value<String?> fats = const Value.absent(),
            Value<String?> carbohydrates = const Value.absent(),
            Value<String?> calories = const Value.absent(),
            Value<String?> recipeUrl = const Value.absent(),
            required String listOfIngredients,
            required String listOfSteps,
            required bool isFavourite,
          }) =>
              RecipeCompanion.insert(
            id: id,
            title: title,
            cookingTime: cookingTime,
            numberOfPortions: numberOfPortions,
            category: category,
            description: description,
            proteins: proteins,
            fats: fats,
            carbohydrates: carbohydrates,
            calories: calories,
            recipeUrl: recipeUrl,
            listOfIngredients: listOfIngredients,
            listOfSteps: listOfSteps,
            isFavourite: isFavourite,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RecipeTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({category = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable: $$RecipeTableReferences._categoryTable(db),
                    referencedColumn:
                        $$RecipeTableReferences._categoryTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RecipeTableProcessedTableManager = ProcessedTableManager<
    _$CookManagerDatabase,
    $RecipeTable,
    RecipeData,
    $$RecipeTableFilterComposer,
    $$RecipeTableOrderingComposer,
    $$RecipeTableAnnotationComposer,
    $$RecipeTableCreateCompanionBuilder,
    $$RecipeTableUpdateCompanionBuilder,
    (RecipeData, $$RecipeTableReferences),
    RecipeData,
    PrefetchHooks Function({bool category})>;

class $CookManagerDatabaseManager {
  final _$CookManagerDatabase _db;
  $CookManagerDatabaseManager(this._db);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$RecipeTableTableManager get recipe =>
      $$RecipeTableTableManager(_db, _db.recipe);
}
