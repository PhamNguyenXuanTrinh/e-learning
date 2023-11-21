import 'package:elearning/src/core/utils/validate/validate.dart';
import 'package:elearning/src/presentation/views/otp/otp_screen.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({super.key});

  

  @override
  _EnterOtpViewState createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        toolbarHeight: 220,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.continuePhone,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(AppImages.imgPhone),
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
              const SizedBox(
                height: 15,
              ),
              const Text(AppStrings.enterYourPhone),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _phoneController, 
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: AppStrings.enterYourPhone,
                        hintStyle:
                            TextStyle(color: Theme.of(context).canvasColor),
                      ),
                      validator: Validator.validatePhone,
                    ),
                  ),
                  PrimaryBtn(
                    text: AppStrings.btnCtn,
                    width: 160,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        String phoneNumber = _phoneController.text;

                        // Perform your navigation logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpView(phoneNumber: phoneNumber),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}