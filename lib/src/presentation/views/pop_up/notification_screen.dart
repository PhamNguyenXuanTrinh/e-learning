import 'package:flutter/material.dart';

import '../../../core/utils/constants/imgs.dart';
import '../../../core/utils/constants/strings.dart';

class NotificationPopUp extends StatelessWidget {
  const NotificationPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage(AppImages.imgNotification),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              AppStrings.noNotification,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.subNoNotification,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).cardColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
