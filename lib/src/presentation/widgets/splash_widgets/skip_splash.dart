// skip.dart
import 'package:elearning/src/presentation/widgets/splash_widget/skip_splash.dart';
import 'package:flutter/material.dart';

Widget skip(int index, PageController pageController) {
  if (index == 0 || index == 1) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SkipButtonSplash(
            onPressed: () {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
}
