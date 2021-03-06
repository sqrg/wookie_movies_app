// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'core/api/api_client.dart';
import 'core/data/moor_database.dart';
import 'core/services/movies_service.dart';
import 'core/services/overlay_service.dart';

final locator = StackedLocator.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => AppDatabase());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => MoviesService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => OverlayService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);
}
