import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/choice_your_account_widget.dart';
import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/course_widget.dart';
import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/find_account_widget.dart';
import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/language_painting_widget.dart';
import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/photo_account_widget.dart';
import 'package:elearning/src/presentation/views/course_detail_screen/course_detail_screen_widget/text_choice_account_widget.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CourseWidget(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PhotoAccountWidget(),
                ),
              ),
            ],
          ),
          FindAccountWidget(),
          languagePainting(),
          Align(
            alignment: Alignment.centerLeft,
            child: TextChoiceYourAccountWidget(),
          ),
          Expanded(
            child: ChoiceYourAccountScreen(),
          ),
        ],
      ),
    );
  }
}
