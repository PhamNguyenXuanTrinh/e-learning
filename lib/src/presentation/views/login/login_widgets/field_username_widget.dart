import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:elearning/src/core/utils/validate/validate.dart';
import 'package:flutter/material.dart';

class FieldUsername extends StatelessWidget {
  final TextEditingController controller;

  const FieldUsername({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.validateUsername,
      controller: controller,
      decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintText: AppStrings.yourEmail,
      hintStyle: TextStyle(color: Theme.of(context).canvasColor),
      ),
    );
  }
}
