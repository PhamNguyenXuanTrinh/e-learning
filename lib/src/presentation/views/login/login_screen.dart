import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/field_username_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/text_username_widget.dart';
import 'package:elearning/src/presentation/views/login/signup_screen.dart';
import 'package:elearning/src/presentation/views/navigation_bar/navigation_bar_screen.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/field_password_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/login_title_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/text_password_widget.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        toolbarHeight: 150,
        title: const LoginTitle(title: AppStrings.login, showDetails: false),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TextUsername(),
              const SizedBox(
                height: 10,
              ),
              FieldUsername(controller: _usernameController),
              const SizedBox(
                height: 30,
              ),
              const TextPassword(),
              const SizedBox(
                height: 10,
              ),
              FieldPassword(controller: _passwordController),
              const SizedBox(
                height: 30,
              ),
              PrimaryBtn(
                text: AppStrings.login,
                onTap: () {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    // String username = _usernameController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NavView()),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Align(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(AppStrings.textAccount),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ));
                        },
                        child: Text(
                          AppStrings.signup,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  ],
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.orLogin,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(AppImages.imgGoogle),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(AppImages.imgFb),
                ],
              )
            ],
          ),
        ));
  }
}
