import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:wookie_movies_app/app.locator.dart';
import 'package:wookie_movies_app/app.router.dart';

import 'package:wookie_movies_app/core/data/moor_database.dart';
import 'package:wookie_movies_app/core/models/movie_api_response.dart';
import 'package:wookie_movies_app/core/services/movies_service.dart';

class MoviesViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AppDatabase _appDatabase = locator<AppDatabase>();

  MoviesService _moviesService = locator<MoviesService>();

  List<Movie> movies = [];

  List<MovieApiResponse> apiMovies = [];

  Future initialize() async {
    setBusy(true);

    apiMovies = await _moviesService.getMovies();

    for (var apiMovie in apiMovies) {
      _appDatabase.insertMovie(apiMovie.toDbMovie());
    }

    movies = await _appDatabase.getAllMovies();

    setBusy(false);
  }

  void navigateToMovieDetail(Movie movie) {
    _navigationService.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movie: movie),
    );
  }
}
