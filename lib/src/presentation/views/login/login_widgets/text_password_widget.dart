import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class TextPassword extends StatelessWidget {
  const TextPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(AppStrings.yourPassword),
    );
  }
}
