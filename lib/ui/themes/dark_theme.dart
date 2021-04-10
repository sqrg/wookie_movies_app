import 'package:flutter/material.dart';

import 'package:wookie_movies_app/ui/themes/base_theme.dart';

ThemeData getDarkTheme() {
  ThemeData baseTheme = getBaseTheme();

  return ThemeData(
    primaryColor: baseTheme.primaryColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white)
    ),
    backgroundColor: Colors.black,
    textButtonTheme: baseTheme.textButtonTheme,
  );
}
