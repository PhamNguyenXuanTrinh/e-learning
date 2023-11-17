import 'package:elearning/src/presentation/views/dialog/dialog_success_screen.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:elearning/src/presentation/validate/validate.dart';

class OtpView extends StatelessWidget {
  final String phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  OtpView({Key? key, required this.phoneNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 170,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.verifyPhone,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              AppStrings.codePhone + phoneNumber,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: Theme.of(context).primaryColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: Validator.validateOtp,
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(verificationCode),
                            content:
                                Text(AppStrings.codeEntered + verificationCode),
                          );
                        });
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryBtn(
                  text: AppStrings.btnVerify,
                  width: 200,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform your navigation logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DialogSuccessView()),
                      );
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
