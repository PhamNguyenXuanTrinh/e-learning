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
        child: Text(
          'Skip',
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
