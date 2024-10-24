// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      cookingTime: json['cookingTime'] as String,
      numberOfPortions: json['numberOfPortions'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String?,
      proteins: json['proteins'] as String?,
      fats: json['fats'] as String?,
      carbohydrates: json['carbohydrates'] as String?,
      calories: json['calories'] as String?,
      recipeUrl: json['recipeUrl'] as String?,
      listOfIngredients: (json['listOfIngredients'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      listOfSteps: (json['listOfSteps'] as List<dynamic>)
          .map((e) =>
              e == null ? null : RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavourite: json['isFavourite'] as bool? ?? false,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cookingTime': instance.cookingTime,
      'numberOfPortions': instance.numberOfPortions,
      'category': instance.category,
      'description': instance.description,
      'proteins': instance.proteins,
      'fats': instance.fats,
      'carbohydrates': instance.carbohydrates,
      'calories': instance.calories,
      'recipeUrl': instance.recipeUrl,
      'listOfIngredients': instance.listOfIngredients,
      'listOfSteps': instance.listOfSteps,
      'isFavourite': instance.isFavourite,
    };
