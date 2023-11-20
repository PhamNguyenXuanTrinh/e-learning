// content_from.dart
import 'package:flutter/material.dart';
import 'package:elearning/src/domain/models/course_screen_models/course_screen_models.dart';

import 'package:elearning/src/fake_data/mock_data/course_mock_data.dart';

class ShadowedTile extends StatelessWidget {
  final Widget child;

  const ShadowedTile({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

Widget buildTabContentFromApi1() {
  return ListView.builder(
    itemCount: introductionCourse.length,
    itemBuilder: (context, index) {
      CourseModel course = introductionCourse[index];
      return ShadowedTile(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.titleCourseTab),
              Text(course.teachTab),
            ],
          ),
          subtitle: RichText(
            text: TextSpan(
              text:
                  '${course.moneyTab.toString()}  ', // Displayed in blue with 2px spacing
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                // Add other text styling as needed
              ),
              children: [
                TextSpan(
                  text: course.timeTab, // Displayed in red
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    // Add other text styling as needed
                  ),
                ),
              ],
            ),
          ),
          leading: Container(
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(course.imageUrl),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget buildTabContentFromApi2() {
  return ListView.builder(
    itemCount: introductionCourse.length,
    itemBuilder: (context, index) {
      CourseModel course = introductionCourse[index];
      return ShadowedTile(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.titleCourseTab),
              Text(course.teachTab),
            ],
          ),
          subtitle: RichText(
            text: TextSpan(
              text:
                  '${course.moneyTab.toString()}  ', // Displayed in blue with 2px spacing
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                // Add other text styling as needed
              ),
              children: [
                TextSpan(
                  text: course.timeTab, // Displayed in red
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    // Add other text styling as needed
                  ),
                ),
              ],
            ),
          ),
          leading: Container(
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(course.imageUrl),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget buildTabContentFromApi3() {
  return ListView.builder(
    itemCount: introductionCourse.length,
    itemBuilder: (context, index) {
      CourseModel course = introductionCourse[index];
      return ShadowedTile(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.titleCourseTab),
              Text(course.teachTab),
            ],
          ),
          subtitle: RichText(
            text: TextSpan(
              text:
                  '${course.moneyTab.toString()}  ', // Displayed in blue with 2px spacing
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                // Add other text styling as needed
              ),
              children: [
                TextSpan(
                  text: course.timeTab, // Displayed in red
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    // Add other text styling as needed
                  ),
                ),
              ],
            ),
          ),
          leading: Container(
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(course.imageUrl),
              ),
            ),
          ),
        ),
      );
    },
  );
}
