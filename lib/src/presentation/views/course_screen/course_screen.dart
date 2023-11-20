import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/choice_your_account_widget.dart';
import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/course_widget.dart';
import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/find_account_widget.dart';
import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/language_painting_widget.dart';
import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/photo_account_widget.dart';
import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/text_choice_account_widget.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

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
          LanguagePainting(),
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
