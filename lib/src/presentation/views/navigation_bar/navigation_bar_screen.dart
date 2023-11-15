import 'package:elearning/src/presentation/views/account_page/account_screen.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<NavView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Text("Home Page"),
    const Text("Course Page"),
    const Text("Message Page"),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //handler
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).hintColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).scaffoldBackgroundColor,
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildNavbarItem(Icons.home, AppStrings.iconHome, 0),
            buildNavbarItem(Icons.collections, AppStrings.iconCourse, 1),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Text(
                AppStrings.iconSearch,
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ),
            buildNavbarItem(Icons.message, AppStrings.iconMessage, 2),
            buildNavbarItem(Icons.account_circle, AppStrings.iconAccount, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavbarItem(IconData icon, String label, int index) {
    Color iconColor = _currentIndex == index
        ? Theme.of(context).primaryColor
        : Theme.of(context).highlightColor;
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
