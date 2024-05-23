import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final bool isObscureText;
  final String hintText;
  final TextEditingController controller;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      decoration: InputDecoration(hintText: hintText, fillColor: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
    );
  }
}
