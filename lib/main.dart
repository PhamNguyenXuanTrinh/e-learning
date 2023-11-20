// import 'package:elearning/src/presentation/views/login/signup_screen.dart';
import 'package:elearning/src/presentation/views/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'src/injector/injector.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: AppTheme.lightTheme(),
      home: SafeArea(
        child: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
