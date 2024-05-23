import 'package:cat_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 3),
      borderRadius: BorderRadius.circular(10));
  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: border(),
        focusedBorder: border(AppPallete.gradient2)),
  );
}
