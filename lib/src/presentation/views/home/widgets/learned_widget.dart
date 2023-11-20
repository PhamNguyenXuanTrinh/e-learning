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
        color: Colors.white.withOpacity(1.0), // Màu trắng với độ mờ 1.0
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  homeModel.myCourseText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
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
                    color: Colors.black,
                  ),
                ),
                Text(
                  homeModel.time60Text,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Thêm khoảng trống
            Container(
              height: 5, // Chiều cao của hình chữ nhật
              color: const Color(
                  0xFFF4F3FD), // Màu của hình chữ nhật    ////thêm hình ảnh thay thế
            ),
          ],
        ),
      ),
    );
  }
}
