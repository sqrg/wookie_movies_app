class MoviesApiResponse {
  List<Movie> movies;

  MoviesApiResponse({this.movies});

  MoviesApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  String backdrop;
  List<String> cast;
  String classification;
  List<dynamic> director = [];
  List<String> genres = [];
  String id;
  double imdbRating;
  String length;
  String overview;
  String poster;
  String releasedOn;
  String slug;
  String title;

  Movie({this.backdrop, this.cast, this.classification, this.director, this.genres, this.id, this.imdbRating, this.length, this.overview, this.poster, this.releasedOn, this.slug, this.title});

  Movie.fromJson(Map<String, dynamic> json) {
    backdrop = json['backdrop'];
    cast = json['cast'].cast<String>();
    classification = json['classification'];

    if (json['director'] is List<dynamic>) {
      director = json['director'];
    } else {
      director.add(json['director']);
    }

    genres = json['genres'].cast<String>();
    id = json['id'];
    imdbRating = json['imdb_rating'];
    length = json['length'];
    overview = json['overview'];
    poster = json['poster'];
    releasedOn = json['released_on'];
    slug = json['slug'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop'] = this.backdrop;
    data['cast'] = this.cast;
    data['classification'] = this.classification;
    data['director'] = this.director;
    data['genres'] = this.genres;
    data['id'] = this.id;
    data['imdb_rating'] = this.imdbRating;
    data['length'] = this.length;
    data['overview'] = this.overview;
    data['poster'] = this.poster;
    data['released_on'] = this.releasedOn;
    data['slug'] = this.slug;
    data['title'] = this.title;
    return data;
  }
}
