import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:wookie_movies_app/app.locator.dart';
import 'package:wookie_movies_app/app.router.dart';

import 'package:wookie_movies_app/core/data/moor_database.dart';
import 'package:wookie_movies_app/core/models/movie_api_response.dart';
import 'package:wookie_movies_app/core/services/movies_service.dart';

import 'package:wookie_movies_app/constants.dart' as Constants;

class MoviesViewModel extends BaseViewModel {
  AppDatabase _appDatabase = locator<AppDatabase>();
  MoviesService _moviesService = locator<MoviesService>();
  NavigationService _navigationService = locator<NavigationService>();
  SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  List<String> genres = [];

  List<Movie> movies = [];

  List<MovieApiResponse> apiMovies = [];

  Map moviesGroupedByGenre = Map();

  bool connectivity;

  Future initialize() async {
    await refreshMovies();
  }

  Future refreshMovies() async {
    setBusy(true);

    connectivity = await _checkForConnectivity();

    if (connectivity) {
      apiMovies = await _moviesService.getMovies();

      for (var apiMovie in apiMovies) {
        _appDatabase.insertOrUpdateMovie(apiMovie.toDbMovie());
      }
    }

    movies = await _appDatabase.getAllMovies();

    genres = _sharedPreferences.getStringList(Constants.GENRES);

    for (var genre in genres) {
      moviesGroupedByGenre[genre] = await _appDatabase.getMoviesByGenre(genre);
    }

    setBusy(false);
  }

  void navigateToMovieDetail(Movie movie) {
    _navigationService.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movie: movie),
    );
  }

  Future<bool> _checkForConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
