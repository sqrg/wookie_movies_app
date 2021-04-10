import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:wookie_movies_app/core/api/api_client.dart';
import 'package:wookie_movies_app/core/data/moor_database.dart';
import 'package:wookie_movies_app/core/services/movies_service.dart';
import 'package:wookie_movies_app/core/services/overlay_service.dart';

import 'package:wookie_movies_app/ui/views/main_view.dart';
import 'package:wookie_movies_app/ui/views/movie_detail_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainView, initial: true),
    MaterialRoute(page: MovieDetailView),
  ],
  dependencies: [
    LazySingleton(classType: ApiClient),
    LazySingleton(classType: AppDatabase),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: FlutterSecureStorage),
    LazySingleton(classType: MoviesService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: OverlayService),
    LazySingleton(classType: ThemeService, resolveUsing: ThemeService.getInstance),
    Presolve(classType: SharedPreferences, presolveUsing: SharedPreferences.getInstance),
  ],
)
class AppSetup {}
