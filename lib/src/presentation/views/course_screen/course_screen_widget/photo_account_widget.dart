import 'package:flutter/material.dart';
import '../../../../core/utils/constants/imgs.dart';

class PhotoAccountWidget extends StatelessWidget {
  const PhotoAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 14.0),
          child: Image.asset(
            AppImages.imgAccountCourse,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
