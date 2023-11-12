import 'package:elearning/src/presentation/widgets/loginWidgets/btn_login.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/field_password.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/field_username.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/login_title.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/text_password.dart';
import 'package:elearning/src/presentation/widgets/loginWidgets/text_username.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 209, 214, 218),
        toolbarHeight: 150,
        title: LoginTitle(title: 'Log In', showDetails: false),
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
          LoginBtn(text: 'Log in',isLogin: true,),
          SizedBox(height: 20,),
         Center(
          child: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account？"),
                TextButton(onPressed: (){}, child: Text("Sign up",
                  style: TextStyle( decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ))
              ],
            )
          ),
         ),
         SizedBox(height: 20,),
         Align(
          alignment: Alignment.center,
          child: Text("Or login with"),
         ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/google.png'),
              SizedBox(width: 30,),
              Image.asset('assets/img/fb.png'),
            ],
          )
        ],
      ),
    );
  }

 
}

