
import 'package:flutter/material.dart';
import 'package:elearning/src/domain/models/home_model.dart';


class TitleWidget extends StatelessWidget {
  final HomeModel? homeData;

  const TitleWidget({
    Key? key,
    required this.homeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          homeData?.info.name ?? "",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        Text(
          homeData?.info.welcomeMessage ?? "",
          style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ],
    );
  }
}
