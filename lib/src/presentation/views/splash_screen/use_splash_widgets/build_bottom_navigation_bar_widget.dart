import 'package:flutter/material.dart';

Widget buildBottomNavigationBar(int selectedIndex, PageController pageController,BuildContext context) {
  return SizedBox(
    height: 80,
    width: 88,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDotButton(selectedIndex, pageController, 0, context),
        _buildDotButton(selectedIndex, pageController, 1, context),
        _buildDotButton(selectedIndex, pageController, 2, context),
      ],
    ),
  );
}

Widget _buildDotButton(int selectedIndex, PageController pageController, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
    child: AnimatedContainer(
      width: selectedIndex == index ? 30 : 10,
      height: 5,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: selectedIndex == index ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
      ),
    ),
  );
}
