// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get cookingTime => throw _privateConstructorUsedError;
  String get numberOfPortions => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get proteins => throw _privateConstructorUsedError;
  String? get fats => throw _privateConstructorUsedError;
  String? get carbohydrates => throw _privateConstructorUsedError;
  String? get calories => throw _privateConstructorUsedError;
  String? get recipeUrl => throw _privateConstructorUsedError;
  List<Ingredient> get listOfIngredients => throw _privateConstructorUsedError;
  List<RecipeStep> get listOfSteps => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String cookingTime,
      String numberOfPortions,
      int category,
      String? description,
      String? imageUrl,
      String? proteins,
      String? fats,
      String? carbohydrates,
      String? calories,
      String? recipeUrl,
      List<Ingredient> listOfIngredients,
      List<RecipeStep> listOfSteps,
      bool isFavourite});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? cookingTime = null,
    Object? numberOfPortions = null,
    Object? category = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? proteins = freezed,
    Object? fats = freezed,
    Object? carbohydrates = freezed,
    Object? calories = freezed,
    Object? recipeUrl = freezed,
    Object? listOfIngredients = null,
    Object? listOfSteps = null,
    Object? isFavourite = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cookingTime: null == cookingTime
          ? _value.cookingTime
          : cookingTime // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPortions: null == numberOfPortions
          ? _value.numberOfPortions
          : numberOfPortions // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as String?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as String?,
      carbohydrates: freezed == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeUrl: freezed == recipeUrl
          ? _value.recipeUrl
          : recipeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfIngredients: null == listOfIngredients
          ? _value.listOfIngredients
          : listOfIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      listOfSteps: null == listOfSteps
          ? _value.listOfSteps
          : listOfSteps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String cookingTime,
      String numberOfPortions,
      int category,
      String? description,
      String? imageUrl,
      String? proteins,
      String? fats,
      String? carbohydrates,
      String? calories,
      String? recipeUrl,
      List<Ingredient> listOfIngredients,
      List<RecipeStep> listOfSteps,
      bool isFavourite});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? cookingTime = null,
    Object? numberOfPortions = null,
    Object? category = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? proteins = freezed,
    Object? fats = freezed,
    Object? carbohydrates = freezed,
    Object? calories = freezed,
    Object? recipeUrl = freezed,
    Object? listOfIngredients = null,
    Object? listOfSteps = null,
    Object? isFavourite = null,
  }) {
    return _then(_$RecipeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cookingTime: null == cookingTime
          ? _value.cookingTime
          : cookingTime // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPortions: null == numberOfPortions
          ? _value.numberOfPortions
          : numberOfPortions // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as String?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as String?,
      carbohydrates: freezed == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeUrl: freezed == recipeUrl
          ? _value.recipeUrl
          : recipeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfIngredients: null == listOfIngredients
          ? _value._listOfIngredients
          : listOfIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      listOfSteps: null == listOfSteps
          ? _value._listOfSteps
          : listOfSteps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {this.id,
      required this.title,
      required this.cookingTime,
      required this.numberOfPortions,
      required this.category,
      this.description,
      this.imageUrl,
      this.proteins,
      this.fats,
      this.carbohydrates,
      this.calories,
      this.recipeUrl,
      required final List<Ingredient> listOfIngredients,
      required final List<RecipeStep> listOfSteps,
      this.isFavourite = false})
      : _listOfIngredients = listOfIngredients,
        _listOfSteps = listOfSteps;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String cookingTime;
  @override
  final String numberOfPortions;
  @override
  final int category;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? proteins;
  @override
  final String? fats;
  @override
  final String? carbohydrates;
  @override
  final String? calories;
  @override
  final String? recipeUrl;
  final List<Ingredient> _listOfIngredients;
  @override
  List<Ingredient> get listOfIngredients {
    if (_listOfIngredients is EqualUnmodifiableListView)
      return _listOfIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfIngredients);
  }

  final List<RecipeStep> _listOfSteps;
  @override
  List<RecipeStep> get listOfSteps {
    if (_listOfSteps is EqualUnmodifiableListView) return _listOfSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfSteps);
  }

  @override
  @JsonKey()
  final bool isFavourite;

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, cookingTime: $cookingTime, numberOfPortions: $numberOfPortions, category: $category, description: $description, imageUrl: $imageUrl, proteins: $proteins, fats: $fats, carbohydrates: $carbohydrates, calories: $calories, recipeUrl: $recipeUrl, listOfIngredients: $listOfIngredients, listOfSteps: $listOfSteps, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cookingTime, cookingTime) ||
                other.cookingTime == cookingTime) &&
            (identical(other.numberOfPortions, numberOfPortions) ||
                other.numberOfPortions == numberOfPortions) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.recipeUrl, recipeUrl) ||
                other.recipeUrl == recipeUrl) &&
            const DeepCollectionEquality()
                .equals(other._listOfIngredients, _listOfIngredients) &&
            const DeepCollectionEquality()
                .equals(other._listOfSteps, _listOfSteps) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      cookingTime,
      numberOfPortions,
      category,
      description,
      imageUrl,
      proteins,
      fats,
      carbohydrates,
      calories,
      recipeUrl,
      const DeepCollectionEquality().hash(_listOfIngredients),
      const DeepCollectionEquality().hash(_listOfSteps),
      isFavourite);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {final int? id,
      required final String title,
      required final String cookingTime,
      required final String numberOfPortions,
      required final int category,
      final String? description,
      final String? imageUrl,
      final String? proteins,
      final String? fats,
      final String? carbohydrates,
      final String? calories,
      final String? recipeUrl,
      required final List<Ingredient> listOfIngredients,
      required final List<RecipeStep> listOfSteps,
      final bool isFavourite}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get cookingTime;
  @override
  String get numberOfPortions;
  @override
  int get category;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String? get proteins;
  @override
  String? get fats;
  @override
  String? get carbohydrates;
  @override
  String? get calories;
  @override
  String? get recipeUrl;
  @override
  List<Ingredient> get listOfIngredients;
  @override
  List<RecipeStep> get listOfSteps;
  @override
  bool get isFavourite;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
