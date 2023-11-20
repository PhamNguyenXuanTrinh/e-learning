import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.imgAvt,
      width: 36.0,
      height: 49.98,
      fit: BoxFit.contain,
    );
  }
}
