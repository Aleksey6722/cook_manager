class Categories {
  final List<CategoryDto> items = const [
    CategoryDto(imageUrl: 'assets/images/salad.jpg', name: 'Салаты'),
    CategoryDto(imageUrl: 'assets/images/snaks.jpg', name: 'Закуски'),
    CategoryDto(imageUrl: 'assets/images/soup.jpg', name: 'Первые блюда'),
    CategoryDto(imageUrl: 'assets/images/main_dishes.jpg', name: 'Главные блюда'),
    CategoryDto(imageUrl: 'assets/images/desert.jpg', name: 'Десерты и выпечка'),
    CategoryDto(imageUrl: 'assets/images/drinks.jpg', name: 'Напитки'),
  ];
}

class CategoryDto {
  const CategoryDto({required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;
}