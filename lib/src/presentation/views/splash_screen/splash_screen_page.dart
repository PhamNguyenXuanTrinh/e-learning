import 'package:flutter/material.dart';
import 'package:elearning/src/presentation/widgets/splash_widgets/buildBottomNavigationBar.dart';
import 'package:elearning/src/presentation/widgets/splash_widgets/content_splash.dart';
import 'package:elearning/src/presentation/widgets/splash_widgets/introduction.dart';
import 'package:elearning/src/presentation/widgets/splash_widgets/login_signup.dart';
import 'package:elearning/src/presentation/widgets/splash_widgets/skip_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<SplashScreen> {
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
          // Add buildBottomNavigationBar outside the Expanded
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        skip(index, _pageController),
        introduction(index),
        ContentWidget(index: index),
        buildBottomNavigationBar(_selectedIndex, _pageController),
        const SizedBox(height: 40),
        loginSignup(index),
      ],
    );
  }
}
