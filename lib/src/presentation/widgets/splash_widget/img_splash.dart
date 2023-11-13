import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  final String imageAsset; // Đường dẫn assets của ảnh

  const MyImage({
    Key? key,
    required this.imageAsset, // Thêm thông tin hình ảnh
  }) : super(key: key);

  @override
  State<MyImage> createState() => _ImgaeSplashState();
}

class _ImgaeSplashState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          widget.imageAsset, // Sử dụng đường dẫn ảnh từ tham số
          width: 260,
          height: 260,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
