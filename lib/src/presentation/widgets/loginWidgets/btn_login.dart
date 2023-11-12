import 'package:elearning/src/presentation/views/home/home_screen.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone.dart';
import 'package:flutter/material.dart';

class LoginBtn extends StatefulWidget {
  final String text;
  final bool isLogin;
  const LoginBtn({
    Key? key,
    required this.text, required this.isLogin,
  }) : super(key: key);

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: (){
          if(widget.isLogin){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeView(),
            ));
          }else{
             Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EnterOtpView(),
            ));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3D5CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(widget.text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
