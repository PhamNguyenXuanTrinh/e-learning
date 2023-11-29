import 'package:flutter/material.dart';

import '../../../core/utils/constants/imgs.dart';
import '../../../core/utils/constants/strings.dart';
import '../../widgets/btn_primary_widget.dart';

class VideoPopUp extends StatelessWidget {
  const VideoPopUp({super.key});

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
                  image: AssetImage(AppImages.imgVideo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              AppStrings.noVideos,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.subNoVideos,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).cardColor,
              ),
            ),
            const SizedBox(height: 16),
            PrimaryBtn(
              text: AppStrings.searchMore,
              onTap: () {},
              width: 280,
            ),
          ],
        ),
      ),
    );
  }
}
