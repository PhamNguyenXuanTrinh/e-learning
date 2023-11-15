import 'package:flutter/material.dart';

class PhotoAccountWidget extends StatelessWidget {
  const PhotoAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 14.0),
          child: Image.asset(
            'assets/img/photo_account.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
