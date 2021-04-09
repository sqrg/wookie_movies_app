import 'package:wookie_movies_app/app.locator.dart';
import 'package:wookie_movies_app/core/api/api_client.dart';
import 'package:wookie_movies_app/core/models/movie.dart';

class MoviesService {
  ApiClient _api = locator<ApiClient>();

  Future<List<Movie>> getMovies() async {
    var rawResponse = await _api.get(
      '/movies',
      headers: {'Authorization': 'Bearer Wookie2019'},
    );

    MoviesApiResponse response = MoviesApiResponse.fromJson(rawResponse);

    return response.movies;
  }
}
