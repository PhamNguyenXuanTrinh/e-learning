// main_screen.dart
import 'package:elearning/src/presentation/widgets/content_from.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class ChoiceYourAccountScreen extends StatelessWidget {
  const ChoiceYourAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.only(bottom: 28, right: 14),
            child: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).scaffoldBackgroundColor,
              unselectedLabelColor: Theme.of(context).highlightColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,

              tabs: [
                _buildTabBarItem(AppStrings.choiceYourAccountAll),
                _buildTabBarItem(AppStrings.choiceYourAccountPopular),
                _buildTabBarItem(AppStrings.choiceYourAccountNew),
              ],
            ),
            
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Content for Tab 1
                buildTabContentFromApi1(),

                // Content for Tab 2
                buildTabContentFromApi2(),

                // Content for Tab 3
                buildTabContentFromApi3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Tab _buildTabBarItem(String title) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        constraints: const BoxConstraints(minWidth: 73),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}
