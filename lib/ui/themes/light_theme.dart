import 'package:flutter/material.dart';

import 'package:wookie_movies_app/ui/themes/base_theme.dart';

ThemeData getLightTheme() {
  ThemeData baseTheme = getBaseTheme();

  return ThemeData(
    primaryColor: baseTheme.primaryColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontSize: 20),
      bodyText2: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
      headline1: TextStyle(color: Colors.black, fontSize: 24),
      headline2: TextStyle(color: Colors.black, fontSize: 16),
    ),
    backgroundColor: Colors.white,
    textButtonTheme: baseTheme.textButtonTheme,
  );
}
