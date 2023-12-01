import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/my_course_model.dart';

class LearnedTodayWidget extends StatelessWidget {
  final MyCourseModel mycourseData;

  const LearnedTodayWidget({
    super.key,
    required this.mycourseData,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int timeStudied = mycourseData.learnedToday.timeStudied;
    int timeGoals = mycourseData.learnedToday.timeGoals;

    return Container(
      width: screenWidth,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1.0),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mycourseData.learnedToday.learnedTodayText,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  timeStudied.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  AppStrings.minute,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  AppStrings.slash,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Text(
                  timeGoals.toString(),
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Text(
                  AppStrings.minute,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: screenWidth - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                Container(
                  height: 5,
                  width: (timeStudied / timeGoals) * (screenWidth - 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).splashColor,
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
