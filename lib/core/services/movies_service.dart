import 'package:shared_preferences/shared_preferences.dart';

import 'package:wookie_movies_app/app.locator.dart';

import 'package:wookie_movies_app/core/api/api_client.dart';
import 'package:wookie_movies_app/core/models/movie_api_response.dart';

import 'package:wookie_movies_app/constants.dart' as Constants;

class MoviesService {
  ApiClient _api = locator<ApiClient>();
  SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  Future<List<MovieApiResponse>> getMovies() async {
    var rawResponse = await _api.get(
      '/movies',
      headers: {'Authorization': 'Bearer Wookie2019'},
    );

    MoviesApiResponse response = MoviesApiResponse.fromJson(rawResponse);

    await saveCategories(response.movies);

    return response.movies;
  }

  Future saveCategories(List<MovieApiResponse> movies) async {
    List<String> genres = [];

    for (var movie in movies) {
      for (var genre in movie.genres) {
        String lowerCaseGenre = genre.toLowerCase();
        if (!genres.contains(lowerCaseGenre)) {
          genres.add(lowerCaseGenre);
        }
      }
    }

    await _sharedPreferences.setStringList(Constants.GENRES, genres);
  }
}
