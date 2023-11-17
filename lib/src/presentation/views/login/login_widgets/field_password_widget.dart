import 'package:elearning/src/presentation/validate/validate.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class FieldPassword extends StatefulWidget {
  final TextEditingController controller;

  const FieldPassword({Key? key, required this.controller}) : super(key: key);

  @override
  _FieldPasswordState createState() => _FieldPasswordState();
}

class _FieldPasswordState extends State<FieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.validatePassword,
      controller: widget.controller, // Use the provided controller
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: AppStrings.yourPassword,
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
