import 'package:flutter/material.dart';

Widget buildBottomNavigationBar(int selectedIndex, PageController pageController) {
  return SizedBox(
    height: 80,
    width: 88,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDotButton(selectedIndex, pageController, 0),
        _buildDotButton(selectedIndex, pageController, 1),
        _buildDotButton(selectedIndex, pageController, 2),
      ],
    ),
  );
}

Widget _buildDotButton(int selectedIndex, PageController pageController, int index) {
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
        color: selectedIndex == index ? Colors.blue : const Color(0xFFE9E9E9),
      ),
    ),
  );
}
