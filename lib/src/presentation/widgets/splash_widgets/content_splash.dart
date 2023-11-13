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
      firstIntroductionTitle,
      secondIntroductionTitle,
      thirdIntroductionTitle,
    ];
    List<String> subtitles = [
      firstIntroductionContent,
      secondIntroductionContent,
      thirdIntroductionContent,
    ];

    return ContentSplash(
      title: titles[index],
      subtitle: subtitles[index],
    );
  }
}
