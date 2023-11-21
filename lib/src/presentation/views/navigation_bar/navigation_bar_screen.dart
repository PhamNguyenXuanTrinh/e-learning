import 'package:elearning/src/presentation/views/account_page/account_screen.dart';
import 'package:elearning/src/presentation/views/course_screen/course_screen.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import '../../widgets/btn_primary_widget.dart';
import '../search_filter/detail_search.dart';
import '../search_filter/widgets/btn_toggle_search_widget.dart';
import '../search_filter/widgets/range_slider.widget.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavState();
}

class _NavState extends State<NavView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Text("Home Page"),
    const CourseScreen(),
    const Text("Message Page"),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 8, 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavView()),
                        );
                      },
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    const Center(
                      child: Text(
                        AppStrings.searchFilter,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const Text(
                      AppStrings.category,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: <Widget>[
                        ToggleButtonWidget(text: AppStrings.design),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.painting),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.coding),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: <Widget>[
                        ToggleButtonWidget(text: AppStrings.music),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.visualIdentiy),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.mathmatics),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      AppStrings.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const RangeSliderWidget(),
                    const Text(
                      AppStrings.duration,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        ToggleButtonWidget(text: AppStrings.hours1),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.hours2),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.hours3),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: <Widget>[
                        ToggleButtonWidget(text: AppStrings.hours4),
                        SizedBox(
                          width: 10,
                        ),
                        ToggleButtonWidget(text: AppStrings.hours5),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 55,
                          width: (MediaQuery.of(context).size.width) * 0.3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0),
                              ),
                            ),
                            onPressed: () {
                              /// handler
                            },
                            child: Text(
                              AppStrings.clear,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        PrimaryBtn(
                          text: AppStrings.apply,
                          width: (MediaQuery.of(context).size.width) * 0.5,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailFilterView()),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
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
              padding: EdgeInsets.fromLTRB(17, 23, 0, 0),
              child: Text(
                AppStrings.iconSearch,
                style: TextStyle(color: Theme.of(context).highlightColor),
                textAlign: TextAlign.center,
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
