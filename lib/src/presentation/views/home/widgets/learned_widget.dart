import 'package:elearning/src/domain/models/home_screen/home_model.dart';
import 'package:flutter/material.dart';

class LearnedWidget extends StatelessWidget {
  final HomeModel homeModel;

  const LearnedWidget({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin kích thước màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    // Xác định giá trị top và width dựa trên kích thước màn hình

    return Container(
      width: screenWidth,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .scaffoldBackgroundColor
            .withOpacity(1.0), // Màu trắng với độ mờ 1.0
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
                  homeModel.learnText,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                const Spacer(),
                Text(
                  homeModel.myCourseText,
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
                Text(
                  homeModel.time46Text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  homeModel.time60Text,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Thêm khoảng trống
            Container(
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).highlightColor, // Trắng trong suốt
                    Theme.of(context).scaffoldBackgroundColor, // Trắng
                    Theme.of(context).splashColor, // #FF5106
                    Theme.of(context).secondaryHeaderColor,
                  ],
                  stops: const [0.0, 0.1, 0.5, 0.8],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
