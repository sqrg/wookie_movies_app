import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wookie_movies_app/app.locator.dart';
import 'package:wookie_movies_app/app.router.dart';
import 'package:wookie_movies_app/core/models/movie.dart';
import 'package:wookie_movies_app/core/services/movies_service.dart';

class MoviesViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  MoviesService _moviesService = locator<MoviesService>();

  List<Movie> movies = [];

  Future initialize() async {
    setBusy(true);

    movies = await _moviesService.getMovies();

    setBusy(false);
  }

  void goToMovieDetail(Movie movie) {
    _navigationService.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movie: movie),
    );
  }
}
