import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  const BaseFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [SizedBox(width: 6), Text('Название')],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: TextField(),
        ),
      ],
    );
  }
}
