import 'package:elearning/src/presentation/views/login/login_screen.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/field_username_widget.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone_screen.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/field_password_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/login_title_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/text_password_widget.dart';
import 'package:elearning/src/presentation/views/login/login_widgets/text_username_widget.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        toolbarHeight: 150,
        title: const LoginTitle(
          title: AppStrings.signup,
        ),
      ),
      body: const SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
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
              text: AppStrings.signup,
              onTap: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {
                  // String username = _usernameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EnterOtpView()),
                  );
                }
              },
            ),
            const SizedBox(
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
                const Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                        AppStrings.textCheckBox,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
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
                          builder: (context) => const LoginView(),
                        ));
                      },
                      child: Text(
                        AppStrings.login,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ))
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
