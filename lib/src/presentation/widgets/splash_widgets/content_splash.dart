// content_widget.dart
import 'package:elearning/src/presentation/widgets/splash_widget/content_splash.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  final int index;

  const ContentWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      AppStrings.firstIntroductionTitle,
      AppStrings.secondIntroductionTitle,
      AppStrings.thirdIntroductionTitle,
    ];
    List<String> subtitles = [
      AppStrings.firstIntroductionContent,
      AppStrings.secondIntroductionContent,
      AppStrings.thirdIntroductionContent,
    ];

    return ContentSplash(
      title: titles[index],
      subtitle: subtitles[index],
    );
  }
}
