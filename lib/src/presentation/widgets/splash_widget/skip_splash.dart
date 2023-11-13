import 'package:flutter/material.dart';

class SkipButtonSplash extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButtonSplash({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Color(0xFF858597),
            fontSize: 18,
          ),
          // Thêm canh về bên trái cho văn bản.
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
