// choice_your_account.dart
import 'package:flutter/material.dart';

class TextChoiceYourAccountWidget extends StatelessWidget {
  const TextChoiceYourAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 14.0,
          left: 14.0,
          right: 10.0,
          bottom: 6.0), 
      child: const Text(
        'Choice Your Account',
        style: TextStyle(
          fontWeight: FontWeight.bold, // Đặt chữ in đậm
          fontSize: 20,
        ),
        textAlign: TextAlign.left, 
      ),
    );
  }
}
