import 'package:flutter/material.dart';

class SkipButtonSplash extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButtonSplash({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Color(0xFF858597),
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
