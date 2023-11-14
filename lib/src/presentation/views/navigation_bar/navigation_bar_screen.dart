import 'package:elearning/src/presentation/views/home/home_screen.dart';
import 'package:elearning/src/utils/constants/imgs.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class NavView extends StatefulWidget {
  const NavView({super.key, });

  @override
  State<NavView> createState() => _NavState();
}

class _NavState extends State<NavView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const Text("Course Page"),
    const Text("Search Page"),
    const Text("Message Page"),
    const Text("Account Page"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).hintColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.imgHome),
            label: AppStrings.iconHome,

          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.imgCourse),
            label: AppStrings.iconCourse,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.imgSearch),
            label: AppStrings.iconSearch,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.imgMessage),
            label: AppStrings.iconMessage,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.imgAccount),
            label: AppStrings.iconAccount,
          ),
        ],
      ),
    );
  }
}

