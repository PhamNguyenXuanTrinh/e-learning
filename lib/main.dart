import 'package:elearning/src/config/themes/app_theme.dart';


import 'package:flutter/material.dart';

import 'src/injector/injector.dart';
import 'src/presentation/views/notification/notification.dart';

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
        child: NotificationScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
