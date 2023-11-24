import 'package:elearning/src/config/themes/app_theme.dart';
import 'package:elearning/src/presentation/views/navigation_bar/navigation_bar_screen.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone_screen.dart';
import 'package:elearning/src/presentation/views/splash_screen/splash_screen_page.dart';
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
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      home: const SafeArea(
        child: EnterOtpView(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
