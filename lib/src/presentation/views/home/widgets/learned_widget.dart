import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:elearning/src/domain/models/home_model.dart';
import 'package:elearning/src/presentation/views/my_course_screen/my_course_screen.dart';
import 'package:flutter/material.dart';

class LearnedWidget extends StatelessWidget {
  final HomeModel? homeData;

  const LearnedWidget({
    super.key,
    required this.homeData,
  });

  @override
  Widget build(BuildContext context) {
    if (homeData == null || homeData!.learned == null) {
      return Container();
    }

    double screenWidth = MediaQuery.of(context).size.width;

    int timeStudiedToday = homeData!.learned.timeStudiedToday;
    int timeGoal = homeData!.learned.timeGoal;

    double progress = timeStudiedToday / timeGoal;

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
                  homeData?.learned.learnedText ?? "",
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCourseScreen() ),
                    );
                  },
                  child: Text(
                    homeData?.learned.myCoursesText ?? "",
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '$timeStudiedToday',
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
                  '$timeGoal',
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
                  width: progress * (screenWidth - 60),
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
