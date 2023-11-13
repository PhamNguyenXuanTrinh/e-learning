// login_signup.dart
import 'package:flutter/material.dart';

Widget loginSignup(int index) {
  if (index == 2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle Signup button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: const Size(160, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Signup',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            // Handle Login button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.blue),
            fixedSize: const Size(160, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  } else {
    return Container();
  }
}
