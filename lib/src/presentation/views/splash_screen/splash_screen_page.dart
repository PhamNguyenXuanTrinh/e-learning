import 'package:flutter/material.dart';
import 'package:elearning/src/presentation/views/splash_screen/use_splash_widgets/build_bottom_navigation_bar_widget.dart';
import 'package:elearning/src/presentation/views/splash_screen/use_splash_widgets/content_widget.dart';
import 'package:elearning/src/presentation/views/splash_screen/use_splash_widgets/introduction_widget.dart';
import 'package:elearning/src/presentation/views/splash_screen/use_splash_widgets/login_signup_widget.dart';
import 'package:elearning/src/presentation/views/splash_screen/use_splash_widgets/skip_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const SizedBox(height: 60),
          // skip(_selectedIndex, _pageController),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: List.generate(3, (index) => _buildTabContent(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        skip(index, _pageController),
        introduction(index),
        ContentWidget(index: index),
        buildBottomNavigationBar(_selectedIndex, _pageController, context),
        const SizedBox(height: 40),
        loginSignup(index, context),
      ],
    );
  }
}
