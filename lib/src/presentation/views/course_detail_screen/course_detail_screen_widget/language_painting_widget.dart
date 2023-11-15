// photo_account_widget.dart
import 'package:flutter/material.dart';

class languagePainting extends StatelessWidget {
  const languagePainting({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14.0),
              child: Image.asset(
                'assets/img/language_left.png',
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14.0), 
              child: Image.asset(
                'assets/img/painting_right.png',
                fit: BoxFit.cover, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
