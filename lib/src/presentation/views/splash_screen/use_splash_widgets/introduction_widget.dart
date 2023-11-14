// introduction.dart
import 'package:elearning/src/utils/constants/imgs.dart';
import 'package:flutter/material.dart';
import 'package:elearning/src/presentation/views/splash_screen/splash_widget/img_splash.dart';

Widget introduction(int index) {
  final images = [
    AppImages.imgfirstIntroduction,
    AppImages.imgsecondIntroduction,
    AppImages.imgthirdIntroduction,
  ];

  return MyImage(
    imageAsset: images[index],
  );
}
