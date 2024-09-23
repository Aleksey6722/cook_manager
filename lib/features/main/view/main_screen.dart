import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'main_menu_container.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: Text('Категории'),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                MainMenuContainer(
                  imageUrl: "assets/images/salad.jpg",
                  label: 'Салаты',
                ),
                SizedBox(height: 20),
                MainMenuContainer(
                  imageUrl: "assets/images/snaks.jpg",
                  label: "Закуски",
                ),
                SizedBox(height: 20),
                MainMenuContainer(
                  imageUrl: "assets/images/soup.jpg",
                  label: 'Первые блюда',
                ),
                SizedBox(height: 20),
                MainMenuContainer(
                  imageUrl: "assets/images/main_dishes.jpg",
                  label: 'Главные блюда',
                ),
                SizedBox(height: 20),
                MainMenuContainer(
                  imageUrl: "assets/images/desert.jpg",
                  label: 'Десерты и выпечка',
                ),
                SizedBox(height: 20),
                MainMenuContainer(
                  imageUrl: "assets/images/drinks.jpg",
                  label: 'Напитки',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
      ]
          //
          ),
    );
  }
}
