import 'package:flutter/material.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
     obscureText: true,
     decoration: InputDecoration(
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10)
       ),
       labelText: 'Your Password',
     ),
          );
  }
}