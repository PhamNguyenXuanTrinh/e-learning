// ignore_for_file: prefer_const_constructors

import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class TextPassword extends StatelessWidget {
  const TextPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(yourPassword),
    );
  }
}