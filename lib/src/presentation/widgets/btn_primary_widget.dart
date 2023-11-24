import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  const PrimaryBtn(
      {Key? key,
      required this.text,
      this.width,
      required this.onTap,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFullWidth = width == null;
    final buttonWidth = isFullWidth ? MediaQuery.of(context).size.width : width;

    return SizedBox(
      width: buttonWidth,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
