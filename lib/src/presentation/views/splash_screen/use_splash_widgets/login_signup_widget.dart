// login_signup.dart
import 'package:elearning/src/presentation/views/login/login_screen.dart';
import 'package:elearning/src/presentation/views/login/signup_screen.dart';
import 'package:flutter/material.dart';

Widget loginSignup(int index, context) {
  if (index == 2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SignUpView(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: const Size(160, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Signup',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginView(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
