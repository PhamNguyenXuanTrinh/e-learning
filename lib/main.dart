import 'package:elearning/src/presentation/views/login/login_screen.dart';
import 'package:elearning/src/presentation/views/login/signup_screen.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpView(),
    );
  }
}
