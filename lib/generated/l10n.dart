// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `main`
  String get main {
    return Intl.message(
      'main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `English language`
  String get english_language {
    return Intl.message(
      'English language',
      name: 'english_language',
      desc: '',
      args: [],
    );
  }

  /// `Add recipe`
  String get add_recipe {
    return Intl.message(
      'Add recipe',
      name: 'add_recipe',
      desc: '',
      args: [],
    );
  }

  /// `Edit recipe`
  String get edit_recipe {
    return Intl.message(
      'Edit recipe',
      name: 'edit_recipe',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get recipe_name {
    return Intl.message(
      'Name',
      name: 'recipe_name',
      desc: '',
      args: [],
    );
  }

  /// `Strawberry cake`
  String get recipe_name_placeholder {
    return Intl.message(
      'Strawberry cake',
      name: 'recipe_name_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Cooking time`
  String get cooking_time {
    return Intl.message(
      'Cooking time',
      name: 'cooking_time',
      desc: '',
      args: [],
    );
  }

  /// `Number of servings`
  String get number_of_servings {
    return Intl.message(
      'Number of servings',
      name: 'number_of_servings',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get category_1 {
    return Intl.message(
      'category',
      name: 'category_1',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Source link`
  String get source_link {
    return Intl.message(
      'Source link',
      name: 'source_link',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Method`
  String get method {
    return Intl.message(
      'Method',
      name: 'method',
      desc: '',
      args: [],
    );
  }

  /// `Save recipe`
  String get save_recipe {
    return Intl.message(
      'Save recipe',
      name: 'save_recipe',
      desc: '',
      args: [],
    );
  }

  /// `Enter the`
  String get enter {
    return Intl.message(
      'Enter the',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `A photo from camera`
  String get photo_from_camera {
    return Intl.message(
      'A photo from camera',
      name: 'photo_from_camera',
      desc: '',
      args: [],
    );
  }

  /// `A photo from gallery`
  String get photo_from_gallery {
    return Intl.message(
      'A photo from gallery',
      name: 'photo_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Deleting photo`
  String get deleting_photo {
    return Intl.message(
      'Deleting photo',
      name: 'deleting_photo',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the photo?`
  String get deleting_photo_message {
    return Intl.message(
      'Are you sure you want to delete the photo?',
      name: 'deleting_photo_message',
      desc: '',
      args: [],
    );
  }

  /// `Cansel`
  String get cansel {
    return Intl.message(
      'Cansel',
      name: 'cansel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Ingredient`
  String get ingredient {
    return Intl.message(
      'Ingredient',
      name: 'ingredient',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Nutrition value`
  String get nutrition_label {
    return Intl.message(
      'Nutrition value',
      name: 'nutrition_label',
      desc: '',
      args: [],
    );
  }

  /// `Proteins`
  String get proteins {
    return Intl.message(
      'Proteins',
      name: 'proteins',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: '',
      args: [],
    );
  }

  /// `Fats`
  String get fats {
    return Intl.message(
      'Fats',
      name: 'fats',
      desc: '',
      args: [],
    );
  }

  /// `Carbohydrates`
  String get carbohydrates {
    return Intl.message(
      'Carbohydrates',
      name: 'carbohydrates',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message(
      'Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any recipes in your favourites`
  String get favourite_empty_message {
    return Intl.message(
      'You don\'t have any recipes in your favourites',
      name: 'favourite_empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Create recipe`
  String get create_recipe {
    return Intl.message(
      'Create recipe',
      name: 'create_recipe',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Salads`
  String get salads {
    return Intl.message(
      'Salads',
      name: 'salads',
      desc: '',
      args: [],
    );
  }

  /// `Snacks`
  String get snacks {
    return Intl.message(
      'Snacks',
      name: 'snacks',
      desc: '',
      args: [],
    );
  }

  /// `Soups`
  String get soups {
    return Intl.message(
      'Soups',
      name: 'soups',
      desc: '',
      args: [],
    );
  }

  /// `Main course`
  String get main_course {
    return Intl.message(
      'Main course',
      name: 'main_course',
      desc: '',
      args: [],
    );
  }

  /// `Desserts and bakery`
  String get desserts {
    return Intl.message(
      'Desserts and bakery',
      name: 'desserts',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get drinks {
    return Intl.message(
      'Drinks',
      name: 'drinks',
      desc: '',
      args: [],
    );
  }

  /// `All recipes`
  String get all_recipes {
    return Intl.message(
      'All recipes',
      name: 'all_recipes',
      desc: '',
      args: [],
    );
  }

  /// `Deleting recipe`
  String get deleting_recipe {
    return Intl.message(
      'Deleting recipe',
      name: 'deleting_recipe',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this recipe?`
  String get deleting_recipe_message {
    return Intl.message(
      'Are you sure you want to delete this recipe?',
      name: 'deleting_recipe_message',
      desc: '',
      args: [],
    );
  }

  /// `{howMany, plural, one{1 hour} other{{howMany} hours}}`
  String hoursCount(num howMany) {
    return Intl.plural(
      howMany,
      one: '1 hour',
      other: '$howMany hours',
      name: 'hoursCount',
      desc: '',
      args: [howMany],
    );
  }

  /// `{howMany, plural, one{1 minute} other{{howMany} minutes}}`
  String minutesCount(num howMany) {
    return Intl.plural(
      howMany,
      one: '1 minute',
      other: '$howMany minutes',
      name: 'minutesCount',
      desc: '',
      args: [howMany],
    );
  }

  /// `{howMany, plural, one{1 portion} other{{howMany} portions}}`
  String portionsCount(num howMany) {
    return Intl.plural(
      howMany,
      one: '1 portion',
      other: '$howMany portions',
      name: 'portionsCount',
      desc: '',
      args: [howMany],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `The search did not yield any results`
  String get search_no_result {
    return Intl.message(
      'The search did not yield any results',
      name: 'search_no_result',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get dark_theme {
    return Intl.message(
      'Dark theme',
      name: 'dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Search of recipes...`
  String get search_of_recipes {
    return Intl.message(
      'Search of recipes...',
      name: 'search_of_recipes',
      desc: '',
      args: [],
    );
  }

  /// `Amount of recipes`
  String get amount_of_recipes {
    return Intl.message(
      'Amount of recipes',
      name: 'amount_of_recipes',
      desc: '',
      args: [],
    );
  }

  /// `App version`
  String get app_version {
    return Intl.message(
      'App version',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Step {name}: `
  String recipe_step_number(Object name) {
    return Intl.message(
      'Step $name: ',
      name: 'recipe_step_number',
      desc: '',
      args: [name],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
