import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:wookie_movies_app/app.locator.dart';
import 'package:wookie_movies_app/app.router.dart';

import 'package:wookie_movies_app/core/enums/dialog_type.dart';
import 'package:wookie_movies_app/core/models/movie_api_response.dart';
import 'package:wookie_movies_app/core/services/movies_service.dart';

class SearchViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();
  MoviesService _moviesService = locator<MoviesService>();
  NavigationService _navigationService = locator<NavigationService>();

  List<MovieApiResponse> movies = [];

  Future searchMovies(String searchTerm) async {
    setBusy(true);

    if (searchTerm == null || searchTerm == '') {
      _dialogService.showCustomDialog(
        variant: DialogType.Ko,
        description: 'Debe ingresar un término a buscar',
      );

      setBusy(false);

      return;
    }

    movies = await _moviesService.searchMovies(searchTerm);

    setBusy(false);
  }

  void clearMovies() {
    movies.clear();

    notifyListeners();
  }

  void navigateToMovieDetail(MovieApiResponse movie) {
    _navigationService.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movie: movie.toDbMovie()),
    );
  }
}
