import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class LearnedWidget extends StatelessWidget {
  const LearnedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin kích thước màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    // Xác định giá trị top và width dựa trên kích thước màn hình
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
                  AppStrings.learn,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                const Spacer(),
                Text(
                  AppStrings.mycourse,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  AppStrings.time46,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppStrings.time60,
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
                  width: 46 / 60 * (screenWidth - 60),
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
