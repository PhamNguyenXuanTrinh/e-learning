import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class TextUsername extends StatelessWidget {
  const TextUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(AppStrings.yourEmail),
    );
  }
}
