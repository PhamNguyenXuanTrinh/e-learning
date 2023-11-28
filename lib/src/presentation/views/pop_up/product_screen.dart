import 'package:flutter/material.dart';

import '../../../core/utils/constants/imgs.dart';
import '../../../core/utils/constants/strings.dart';

class ProductPopUp extends StatelessWidget {
  const ProductPopUp({super.key});

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
                  image: AssetImage(AppImages.imgProduct),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              AppStrings.noProduct,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.subNoProduct,
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
