import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/presentation/views/pop_up/widgets/pop_up_widgets.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomPage(
          imagePath: AppImages.imgNotification,
          pageNumber: 1,
        ),
      ),
    );
  }
}
