import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class FieldUsername extends StatelessWidget {
  const FieldUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10)
        ),
        labelText: AppStrings.yourEmail,
      ),
    );
  }
}