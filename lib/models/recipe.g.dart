// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      cookingTime: json['cooking_time'] as String,
      numberOfPortions: json['number_of_portions'] as String,
      category: (json['category'] as num).toInt(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      proteins: json['proteins'] as String?,
      fats: json['fats'] as String?,
      carbohydrates: json['carbohydrates'] as String?,
      calories: json['calories'] as String?,
      recipeUrl: json['recipe_url'] as String?,
      listOfIngredients: (json['list_of_ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      listOfSteps: (json['list_of_steps'] as List<dynamic>)
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavourite: json['is_favourite'] as bool? ?? false,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cooking_time': instance.cookingTime,
      'number_of_portions': instance.numberOfPortions,
      'category': instance.category,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'proteins': instance.proteins,
      'fats': instance.fats,
      'carbohydrates': instance.carbohydrates,
      'calories': instance.calories,
      'recipe_url': instance.recipeUrl,
      'list_of_ingredients':
          instance.listOfIngredients.map((e) => e.toJson()).toList(),
      'list_of_steps': instance.listOfSteps.map((e) => e.toJson()).toList(),
      'is_favourite': instance.isFavourite,
    };
