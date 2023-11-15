// CourseWidget
import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(),
      child: const Text(
        'Course',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
