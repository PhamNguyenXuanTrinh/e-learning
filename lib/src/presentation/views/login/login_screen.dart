// ignore_for_file: prefer_const_constructors

import 'package:elearning/src/presentation/views/login/signup_screen.dart';
import 'package:elearning/src/presentation/widgets/btn_primary.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/field_password.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/field_username.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/login_title.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/text_password.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/text_username.dart';
import 'package:elearning/src/utils/constants/color.dart';
import 'package:elearning/src/utils/constants/imgs.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 209, 214, 218),
        toolbarHeight: 150,
        title: LoginTitle(title: AppStrings.login, showDetails: false),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          PrimaryBtn(text: AppStrings.login),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Align(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppStrings.textAccount),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpView(),
                      ));
                    },
                    child: Text(
                      AppStrings.signup,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: defaultBlue,
                      ),
                    ))
              ],
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.orLogin,
              style: TextStyle(color: defaultBlue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(AppImages.imgGoogle),
              SizedBox(
                width: 30,
              ),
              Image.asset(AppImages.imgFb),
            ],
          )
        ],
      ),
    );
  }
}
