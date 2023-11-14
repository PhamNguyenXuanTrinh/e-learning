import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  final String imageAsset; 

  const MyImage({
    super.key,
    required this.imageAsset, 
  });

  @override
  State<MyImage> createState() => _ImageSplashState();
}

class _ImageSplashState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          widget.imageAsset, 
          width: 260,
          height: 260,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
