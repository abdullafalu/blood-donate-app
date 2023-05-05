import 'package:flutter/material.dart';

class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({
    super.key,
    required this.textName,
    required this.controller,
  });
  final String textName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 15,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: textName,
      ),
    );
  }
}
