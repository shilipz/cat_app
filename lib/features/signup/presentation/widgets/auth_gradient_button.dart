import 'package:cat_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthGradientButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(colors: [
            AppPallete.gradient3,
            AppPallete.gradient2,
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPallete.transparentColor,
              shadowColor: AppPallete.transparentColor,
              fixedSize: const Size(395, 55)),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
          )),
    );
  }
}
