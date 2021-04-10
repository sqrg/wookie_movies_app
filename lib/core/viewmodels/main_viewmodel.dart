import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:wookie_movies_app/app.locator.dart';

import 'package:wookie_movies_app/constants.dart' as Constants;

class MainViewModel extends BaseViewModel {
  SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  ThemeService _themeService = locator<ThemeService>();

  bool isDarkModeEnabled = false;

  void initialize() {
    bool savedIsDarkModeEnabledValue = _sharedPreferences.getBool(Constants.DARK_MODE_SELECTED);
    
    if (savedIsDarkModeEnabledValue == null) return;

    isDarkModeEnabled = savedIsDarkModeEnabledValue;
  }

  void changeTheme(bool value) {
    isDarkModeEnabled = value;

    _themeService.setThemeMode(value ? ThemeManagerMode.dark : ThemeManagerMode.light);

    _sharedPreferences.setBool(Constants.DARK_MODE_SELECTED, _themeService.isDarkMode);
  }
}
