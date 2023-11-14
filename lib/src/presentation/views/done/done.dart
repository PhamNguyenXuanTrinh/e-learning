// ignore_for_file: prefer_const_constructors

import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    double x = 300;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          color: Colors.grey, // Lớp màu nền
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height - x) / 2,
          left: (MediaQuery.of(context).size.width - x) / 2,
          child: Container(
            padding: EdgeInsets.all(15),
            width: x,
            height: x,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: x / 5,
                    height: x / 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                        weight: 400,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.success,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.doneDetails,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                PrimaryBtn(text: AppStrings.doneBtn),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
