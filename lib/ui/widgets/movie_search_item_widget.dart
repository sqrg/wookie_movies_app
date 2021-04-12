import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:wookie_movies_app/core/models/movie_api_response.dart';

class MovieSearchItemWidget extends StatelessWidget {
  const MovieSearchItemWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final MovieApiResponse movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      '(${DateFormat('yyyy').format(movie.releasedOn)}) ${movie.title}',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
