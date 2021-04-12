import 'package:flutter/material.dart';

import 'package:wookie_movies_app/ui/themes/base_theme.dart';

ThemeData getDarkTheme() {
  ThemeData baseTheme = getBaseTheme();

  return ThemeData(
    primaryColor: baseTheme.primaryColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white, fontSize: 20),
      bodyText2: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
      headline1: TextStyle(color: Colors.white, fontSize: 24),
      headline2: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.black,
    textButtonTheme: baseTheme.textButtonTheme,
  );
}
