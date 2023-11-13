// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:elearning/src/presentation/views/home/home_screen.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone.dart';
import 'package:elearning/src/presentation/views/otp/otp.dart';
import 'package:elearning/src/utils/constants/color.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final double? width;

  PrimaryBtn({required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    final isFullWidth = width == null;
    final buttonWidth = isFullWidth ? MediaQuery.of(context).size.width : width;

    return Container(
      width: buttonWidth,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (text == AppStrings.login) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeView(),
            ));
          } else if (text == AppStrings.signup) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EnterOtpView(),
            ));
          } else if(text == AppStrings.btnCtn){
             Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OtpView(),
            ));
          }
          else if(text == AppStrings.btnVerify){
             Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeView(),
            ));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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

