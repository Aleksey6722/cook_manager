// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(howMany) =>
      "${Intl.plural(howMany, one: '1 hour', other: '${howMany} hours')}";

  static String m1(howMany) =>
      "${Intl.plural(howMany, one: '1 minute', other: '${howMany} minutes')}";

  static String m2(howMany) =>
      "${Intl.plural(howMany, one: '1 portion', other: '${howMany} portions')}";

  static String m3(name) => "Step ${name}: ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "add_recipe": MessageLookupByLibrary.simpleMessage("Add recipe"),
        "all_recipes": MessageLookupByLibrary.simpleMessage("All recipes"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "amount_of_recipes":
            MessageLookupByLibrary.simpleMessage("Amount of recipes"),
        "app_version": MessageLookupByLibrary.simpleMessage("App version"),
        "calories": MessageLookupByLibrary.simpleMessage("Calories"),
        "cansel": MessageLookupByLibrary.simpleMessage("Cansel"),
        "carbohydrates": MessageLookupByLibrary.simpleMessage("Carbohydrates"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "category_1": MessageLookupByLibrary.simpleMessage("category"),
        "cooking_time": MessageLookupByLibrary.simpleMessage("Cooking time"),
        "create_recipe": MessageLookupByLibrary.simpleMessage("Create recipe"),
        "dark_theme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleting_photo":
            MessageLookupByLibrary.simpleMessage("Deleting photo"),
        "deleting_photo_message": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete the photo?"),
        "deleting_recipe":
            MessageLookupByLibrary.simpleMessage("Deleting recipe"),
        "deleting_recipe_message": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this recipe?"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "desserts": MessageLookupByLibrary.simpleMessage("Desserts and bakery"),
        "double_tap_to_exit_message": MessageLookupByLibrary.simpleMessage(
            "Press one more time to close"),
        "drinks": MessageLookupByLibrary.simpleMessage("Drinks"),
        "edit_recipe": MessageLookupByLibrary.simpleMessage("Edit recipe"),
        "english_language":
            MessageLookupByLibrary.simpleMessage("English language"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter the"),
        "fats": MessageLookupByLibrary.simpleMessage("Fats"),
        "favourite": MessageLookupByLibrary.simpleMessage("Favourite"),
        "favourite_empty_message": MessageLookupByLibrary.simpleMessage(
            "You don\'t have any recipes in your favourites"),
        "hours": MessageLookupByLibrary.simpleMessage("Hours"),
        "hoursCount": m0,
        "ingredient": MessageLookupByLibrary.simpleMessage("Ingredient"),
        "ingredients": MessageLookupByLibrary.simpleMessage("Ingredients"),
        "list_empty_message": MessageLookupByLibrary.simpleMessage(
            "You don\'t have any recipes in this category"),
        "main": MessageLookupByLibrary.simpleMessage("main"),
        "main_course": MessageLookupByLibrary.simpleMessage("Main course"),
        "method": MessageLookupByLibrary.simpleMessage("Method"),
        "minutesCount": m1,
        "number_of_servings":
            MessageLookupByLibrary.simpleMessage("Number of servings"),
        "nutrition_label":
            MessageLookupByLibrary.simpleMessage("Nutrition value"),
        "photo_from_camera":
            MessageLookupByLibrary.simpleMessage("A photo from camera"),
        "photo_from_gallery":
            MessageLookupByLibrary.simpleMessage("A photo from gallery"),
        "portionsCount": m2,
        "proteins": MessageLookupByLibrary.simpleMessage("Proteins"),
        "recipe_name": MessageLookupByLibrary.simpleMessage("Name"),
        "recipe_name_placeholder":
            MessageLookupByLibrary.simpleMessage("Strawberry cake"),
        "recipe_step_number": m3,
        "salads": MessageLookupByLibrary.simpleMessage("Salads"),
        "save_recipe": MessageLookupByLibrary.simpleMessage("Save recipe"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "search_no_result": MessageLookupByLibrary.simpleMessage(
            "The search did not yield any results"),
        "search_of_recipes":
            MessageLookupByLibrary.simpleMessage("Search of recipes..."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "snacks": MessageLookupByLibrary.simpleMessage("Snacks"),
        "soups": MessageLookupByLibrary.simpleMessage("Soups"),
        "source_link": MessageLookupByLibrary.simpleMessage("Source link"),
        "step": MessageLookupByLibrary.simpleMessage("Step")
      };
}
