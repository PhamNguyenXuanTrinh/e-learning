// photo_account_widget.dart
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/imgs.dart';

class LanguagePainting extends StatelessWidget {
  const LanguagePainting({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Image.asset(
                AppImages.imgLanguage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Image.asset(
                AppImages.imgPainting,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
