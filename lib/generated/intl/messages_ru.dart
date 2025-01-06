// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(howMany) =>
      "${Intl.plural(howMany, one: '1 час', few: '${howMany} часа', other: '${howMany} часов')}";

  static String m1(howMany) =>
      "${Intl.plural(howMany, one: '1 минута', few: '${howMany} минуты', other: '${howMany} минут')}";

  static String m2(howMany) =>
      "${Intl.plural(howMany, one: '1 порция', few: '${howMany} порции', other: '${howMany} порций')}";

  static String m3(name) => "Шаг ${name}: ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "add_recipe": MessageLookupByLibrary.simpleMessage("Добавить рецепт"),
        "all_recipes": MessageLookupByLibrary.simpleMessage("Все рецепты"),
        "amount": MessageLookupByLibrary.simpleMessage("Количество"),
        "amount_of_recipes":
            MessageLookupByLibrary.simpleMessage("Количество рецептов"),
        "app_version":
            MessageLookupByLibrary.simpleMessage("Версия приложения"),
        "calories": MessageLookupByLibrary.simpleMessage("Калории"),
        "cansel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "carbohydrates": MessageLookupByLibrary.simpleMessage("Углеводы"),
        "categories": MessageLookupByLibrary.simpleMessage("Категории"),
        "category": MessageLookupByLibrary.simpleMessage("Категория"),
        "category_1": MessageLookupByLibrary.simpleMessage("категорию"),
        "cooking_time":
            MessageLookupByLibrary.simpleMessage("Время приготовления"),
        "create_recipe": MessageLookupByLibrary.simpleMessage("Создать рецепт"),
        "dark_theme": MessageLookupByLibrary.simpleMessage("Тёмная тема"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleting_photo":
            MessageLookupByLibrary.simpleMessage("Удаление фотографии"),
        "deleting_photo_message": MessageLookupByLibrary.simpleMessage(
            "Вы уверене что хотите удалить фотографию?"),
        "deleting_recipe":
            MessageLookupByLibrary.simpleMessage("Удаление рецепта"),
        "deleting_recipe_message": MessageLookupByLibrary.simpleMessage(
            "Вы уверене что хотите удалить рецепт?"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "desserts": MessageLookupByLibrary.simpleMessage("Десерты и выпечка"),
        "drinks": MessageLookupByLibrary.simpleMessage("Напитки"),
        "edit_recipe":
            MessageLookupByLibrary.simpleMessage("Редактировать рецепт"),
        "english_language":
            MessageLookupByLibrary.simpleMessage("Английский язык"),
        "enter": MessageLookupByLibrary.simpleMessage("Введите"),
        "fats": MessageLookupByLibrary.simpleMessage("Жиры"),
        "favourite": MessageLookupByLibrary.simpleMessage("Избранное"),
        "favourite_empty_message": MessageLookupByLibrary.simpleMessage(
            "У Вас нет ни одного рецепта в избранном"),
        "hours": MessageLookupByLibrary.simpleMessage("Часов"),
        "hoursCount": m0,
        "ingredient": MessageLookupByLibrary.simpleMessage("Ингредиент"),
        "ingredients": MessageLookupByLibrary.simpleMessage("Ингредиенты"),
        "main": MessageLookupByLibrary.simpleMessage("Главная"),
        "main_course": MessageLookupByLibrary.simpleMessage("Вторые блюда"),
        "method": MessageLookupByLibrary.simpleMessage("Пошаговый рецепт"),
        "minutesCount": m1,
        "number_of_servings":
            MessageLookupByLibrary.simpleMessage("Количество порций"),
        "nutrition_label":
            MessageLookupByLibrary.simpleMessage("Пищевая ценность"),
        "photo_from_camera":
            MessageLookupByLibrary.simpleMessage("Загрузить фото с камеры"),
        "photo_from_gallery":
            MessageLookupByLibrary.simpleMessage("Загрузить фото с галереи"),
        "portionsCount": m2,
        "proteins": MessageLookupByLibrary.simpleMessage("Белки"),
        "recipe_name": MessageLookupByLibrary.simpleMessage("Название"),
        "recipe_name_placeholder":
            MessageLookupByLibrary.simpleMessage("Рецепт малинового пирога"),
        "recipe_step_number": m3,
        "salads": MessageLookupByLibrary.simpleMessage("Салаты"),
        "save_recipe": MessageLookupByLibrary.simpleMessage("Сохранить рецепт"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "search_no_result":
            MessageLookupByLibrary.simpleMessage("Поиск не дал результатов"),
        "search_of_recipes":
            MessageLookupByLibrary.simpleMessage("Поиск рецептов..."),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "snacks": MessageLookupByLibrary.simpleMessage("Закуски"),
        "soups": MessageLookupByLibrary.simpleMessage("Первые блюда"),
        "source_link":
            MessageLookupByLibrary.simpleMessage("Ссылка на источник"),
        "step": MessageLookupByLibrary.simpleMessage("Шаг")
      };
}
