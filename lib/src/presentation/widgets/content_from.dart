// content_from.dart
import 'package:flutter/material.dart';
import '../../core/utils/constants/strings.dart';
import '../../domain/models/course_model.dart';
import '../views/course_detail_screen/navigation_detail.dart';

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
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: child,
    );
  }
}

Widget buildTabContentFromApi(List<CourseModel>? courses, BuildContext context) {
  if (courses != null) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        CourseModel course = courses[index];
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
                text: course.moneyTab.toString(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                children: [
                  TextSpan(
                    text: course.timeTab,
                    style: TextStyle(
                      color: Theme.of(context).dividerColor,
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const NavigationDetail(),
                ),
              );
            },
          ),
        );
      },
    );
  } else {
    return const Center(
      child: Text(AppStrings.noCourses),
    );
  }
}

