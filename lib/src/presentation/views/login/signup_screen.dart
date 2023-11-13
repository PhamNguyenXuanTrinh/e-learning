// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elearning/src/presentation/views/login/login_screen.dart';
import 'package:elearning/src/presentation/widgets/btn_primary.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/field_password.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/field_username.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/login_title.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/text_password.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/text_username.dart';
import 'package:elearning/src/utils/constants/color.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 209, 214, 218),
        toolbarHeight: 150,
        title: LoginTitle(
          title: signup,
        ),
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextUsername(),
          FieldUsername(),
          SizedBox(
            height: 30,
          ),
          TextPassword(),
          FieldPassword(),
          SizedBox(
            height: 30,
          ),
          PrimaryBtn(
            text: signup,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (newBool) {
                  setState(() {
                    _isChecked = newBool;
                  });
                },
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    Text(
                      textCheckBox,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Align(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(textAccount),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ));
                    },
                    child: Text(
                      login,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: defaultBlue),
                    ))
              ],
            )),
          ),
        ],
      ),
    );
  }
}
