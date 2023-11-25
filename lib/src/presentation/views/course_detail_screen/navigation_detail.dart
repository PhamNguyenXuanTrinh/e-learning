import 'package:elearning/src/presentation/views/course_detail_screen/course_details_widget/course_detail_widget.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/strings.dart';

class NavigationDetail extends StatefulWidget {
  const NavigationDetail({super.key});

  @override
  State<NavigationDetail> createState() => _NavigationDetailState();
}

class _NavigationDetailState extends State<NavigationDetail> {
  bool isStarPressed = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CourseDetailPage(),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 2.0, top: 8.0, bottom: 8.0),
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isStarPressed = !isStarPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 238,
                        213), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), 
                    ),
                  ),
                  child: Icon(
                    Icons.star,
                    size: 24,
                    color: isStarPressed ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryBtn(
                text: AppStrings.payNow,
                onTap: () {
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
