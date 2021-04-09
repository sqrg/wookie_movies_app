import 'package:flutter/material.dart';

import 'package:wookie_movies_app/ui/themes/base_theme.dart';

ThemeData getLightTheme() {
  ThemeData baseTheme = getBaseTheme();
  
  return ThemeData(
    primaryColor: baseTheme.primaryColor,
    backgroundColor: Colors.white,
    textButtonTheme: baseTheme.textButtonTheme,
  );
}
