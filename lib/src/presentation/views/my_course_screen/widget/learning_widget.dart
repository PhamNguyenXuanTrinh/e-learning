import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import '../../../../domain/models/my_course_model.dart';
import '../../course_detail_screen/course_details_widget/course_detail_widget.dart';

class LearningWidget extends StatelessWidget {
  final MyCourseModel mycourseData;
  const LearningWidget({
    super.key,
    required this.mycourseData,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 400, // Điều chỉnh chiều cao để vừa hai hàng
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: screenWidth / 2 - 15,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE7EE),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 25, 40, 0),
                              child: Text(
                                mycourseData.learning[0].titleMyCourseTab,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: (screenWidth / 2 - 15) - 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width: (14 / 24) *
                                        ((screenWidth / 2 - 15) - 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromRGBO(236, 123, 156, 0.502),
                                          Color(0xFFEC7B9C),
                                        ],
                                        stops: [0.5, 0.957],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mycourseData.learning[0].completedText,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        mycourseData.learning[0].studiedVideos
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        AppStrings.slash,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        mycourseData.learning[0].totalVideos
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CourseDetailPage()), // Thay bằng trang muốn chuyển đến
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(231, 77, 123,
                                    0.502), // Màu sắc của nút Play
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color:
                                    Colors.white, // Màu sắc của biểu tượng Play
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: screenWidth / 2 - 15,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBAD6FF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 25, 40, 0),
                              child: Text(
                                mycourseData.learning[1].titleMyCourseTab,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: (screenWidth / 2 - 15) - 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width: (12 / 18) *
                                        ((screenWidth / 2 - 15) - 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromRGBO(61, 92, 255, 0.502),
                                          Color(0xFF3D5CFF),
                                        ],
                                        stops: [0.5, 1.0],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mycourseData.learning[1].completedText,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        mycourseData.learning[1].studiedVideos
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        AppStrings.slash,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        mycourseData.learning[1].totalVideos
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CourseDetailPage()), // Thay bằng trang muốn chuyển đến
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Color(0xFF3D5CFF) // Màu sắc của nút Play
                                  ),
                              child: const Icon(
                                Icons.play_arrow,
                                color:
                                    Colors.white, // Màu sắc của biểu tượng Play
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: screenWidth / 2 - 15,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBAE0DB),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 25, 40, 0),
                              child: Text(
                                mycourseData.learning[2].titleMyCourseTab,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: (screenWidth / 2 - 15) - 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width: (10 / 16) *
                                        ((screenWidth / 2 - 15) - 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromRGBO(57, 138, 128, 0.502),
                                          Color(0xFF398A80),
                                        ],
                                        stops: [0.5, 1.0],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mycourseData.learning[2].completedText,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        mycourseData.learning[2].studiedVideos
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        AppStrings.slash,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        mycourseData.learning[2].totalVideos
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CourseDetailPage()), // Thay trang muốn chuyển đến
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(
                                    15, 104, 93, 0.502), // Màu sắc của nút Play
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color:
                                    Colors.white, // Màu sắc của biểu tượng Play
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
