// introduction.dart
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:elearning/src/presentation/widgets/splash_widget/img_splash.dart';

Widget introduction(int index) {
  final images = [
    firstIntroductionImage,
    secondIntroductionImage,
    thirdIntroductionImage,
  ];

  return MyImage(
    imageAsset: images[index],
  );
}
