import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/presentation/views/pop_up/widgets/pop_up_widgets.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomPage(
          imagePath: AppImages.imgVideo,
          pageNumber: 3,
        ),
      ),
    );
  }
}
