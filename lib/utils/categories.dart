import 'package:cook_manager/models/category.dart';

class Categories {
  final List<Category> items = const [
    Category(imageUrl: 'assets/images/salad.jpg', name: 'Салаты'),
    Category(imageUrl: 'assets/images/snaks.jpg', name: 'Закуски'),
    Category(imageUrl: 'assets/images/soup.jpg', name: 'Первые блюда'),
    Category(imageUrl: 'assets/images/main_dishes.jpg', name: 'Главные блюда'),
    Category(imageUrl: 'assets/images/desert.jpg', name: 'Десерты и выпечка'),
    Category(imageUrl: 'assets/images/drinks.jpg', name: 'Напитки'),
  ];
}
