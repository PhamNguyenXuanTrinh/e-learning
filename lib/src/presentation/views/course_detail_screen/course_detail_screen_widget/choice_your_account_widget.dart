//choice_your_account_widget.dart
import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/build_text_with_shadow_widget.dart';
import 'package:elearning/src/utils/constants/imgs.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class ChoiceYourAccountScreen extends StatelessWidget {
  const ChoiceYourAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            height: 60,
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.only(left: 14, bottom: 28, right: 14),
            child: TabBar(
              isScrollable: false,
              labelColor: Theme.of(context).scaffoldBackgroundColor,
              unselectedLabelColor: Theme.of(context).highlightColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              labelPadding: const EdgeInsets.only(left: 0, right: 0),
              tabs: [
                Tab(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(AppStrings.choiceYourAccountAll),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(AppStrings.choiceYourAccountPopular),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(AppStrings.choiceYourAccountNew),
                    ),
                  ),
                ),
                Tab(
                  child: Container(),
                ),
                Tab(
                  child: Container(),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherOne,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherTwo,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherThree,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherOne,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherOne,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherTwo,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherThree,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherOne,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherTwo,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                      CourseWidget(
                        titleCourseTab: AppStrings.courseProductDesign,
                        teachTab: AppStrings.courseTeacherThree,
                        moneyTab: AppStrings.courseMoneyTwo,
                        timeTab: AppStrings.courseTimeSixteen,
                        imageUrl: AppImages.imgCourseOne,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
