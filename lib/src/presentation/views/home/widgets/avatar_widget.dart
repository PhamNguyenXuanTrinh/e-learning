import 'package:elearning/src/domain/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/imgs.dart';

class AvatarWidget extends StatelessWidget {
  final HomeModel? homeData;

  const AvatarWidget({
    super.key,
    required this.homeData,
  });

  @override
  Widget build(BuildContext context) {
    final String avatars = homeData?.info.avatar ?? AppImages.imgAvt;
    return Image.asset(
      avatars,
      width: 36.0,
      height: 49.98,
      fit: BoxFit.contain,
    );
  }
}
