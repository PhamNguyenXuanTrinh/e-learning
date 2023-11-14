// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:elearning/src/presentation/views/done/done.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone.dart';
import 'package:elearning/src/presentation/views/otp/otp.dart';
import 'package:elearning/src/presentation/views/navigation_bar/navigation_bar_screen.dart';
class PrimaryBtn extends StatelessWidget {
  final String text;
  final double? width;

  const PrimaryBtn({super.key, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    final isFullWidth = width == null;
    final buttonWidth = isFullWidth ? MediaQuery.of(context).size.width : width;

    return Container(
      width: buttonWidth,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          if (text == AppStrings.login) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NavView(),
            ));
          } else if (text == AppStrings.signup) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EnterOtpView(),
            ));
          } else if (text == AppStrings.btnCtn) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OtpView(),
            ));
          } else if (text == AppStrings.btnVerify) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DoneView(),
            ));
          }else if (text == AppStrings.doneBtn) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NavView(),
            ));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
