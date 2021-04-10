import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:wookie_movies_app/app.locator.dart';
import 'package:wookie_movies_app/app.router.dart';

import 'package:wookie_movies_app/ui/dialog_ui_setup.dart';
import 'package:wookie_movies_app/ui/themes/dark_theme.dart';
import 'package:wookie_movies_app/ui/themes/light_theme.dart';

import 'constants.dart' as Constants;

Future main() async {
  // See: https://stackoverflow.com/a/57775690/2584335
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await ThemeManager.initialise();

  setupDialogUi();

  bool darkModeSelected = locator<SharedPreferences>().getBool(Constants.DARK_MODE_SELECTED);

  runApp(MyApp(darkModeSelected: darkModeSelected));
}

class MyApp extends StatelessWidget {
  final bool darkModeSelected;

  const MyApp({
    Key key,
    this.darkModeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: getLightTheme(),
      darkTheme: getDarkTheme(),
      defaultThemeMode: darkModeSelected ?? false ? ThemeMode.dark : ThemeMode.light,
      builder: (context, theme, darkTheme, themeMode) => OverlaySupport(
        child: MaterialApp(
          title: 'Wookie Movies App',
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          initialRoute: Routes.mainView,
        ),
      ),
    );
  }
}
