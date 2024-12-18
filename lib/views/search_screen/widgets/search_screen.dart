import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/data/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final DataRepository repository = GetIt.instance<DataRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          repository.findText('salad');
        }, child: const Text('Поиск')),
      ),
    );
  }
}
