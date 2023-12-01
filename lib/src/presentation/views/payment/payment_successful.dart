import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

import '../clocking_in/clocking_in.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppImages.imgSuccessful,
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              AppStrings.successful,
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: buildBtn(context),
            ),
          ],
        ),
      ),
    );
  }
}
