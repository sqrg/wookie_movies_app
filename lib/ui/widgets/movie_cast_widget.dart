import 'package:flutter/material.dart';
import 'package:wookie_movies_app/core/models/movie.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Text('Cast: ${movie.castText}', style: Theme.of(context).textTheme.bodyText1);
  }
}
