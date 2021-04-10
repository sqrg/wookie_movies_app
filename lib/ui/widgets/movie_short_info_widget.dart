import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wookie_movies_app/core/models/movie.dart';

class MovieShortInfoWidget extends StatelessWidget {
  const MovieShortInfoWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('yyyy').format(movie.releasedOn)} | ${movie.length} | ${movie.director.first}',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}