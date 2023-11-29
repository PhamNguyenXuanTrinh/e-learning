import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final int pageNumber;

  const CustomPage({super.key, required this.pageNumber, required String imagePath});

  String getImagePath() {
    switch (pageNumber) {
      case 1:
        return AppImages.imgNotification;
      case 2:
        return AppImages.imgNetwork;
      case 3:
        return AppImages.imgVideo;
      case 4:
        return AppImages.imgProduct;
      default:
        return AppImages.imgNotification; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 160,
          height: 160,
          decoration: const BoxDecoration(
          ),
          child: Image.asset(
            getImagePath(),
            width: 160,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
