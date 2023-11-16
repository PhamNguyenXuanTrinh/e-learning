import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/build_text_with_shadow_widget.dart';
import 'package:elearning/src/utils/constants/imgs.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
    );
  }
}
