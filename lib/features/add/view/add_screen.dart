import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/add/view/base_form_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _addRecepieFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Добавить рецепт'),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Form(
                  key: _addRecepieFormKey,
                  child: Column(
                    children: [
                      BaseFormField(),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
