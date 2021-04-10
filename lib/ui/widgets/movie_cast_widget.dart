import 'package:flutter/material.dart';

import 'package:wookie_movies_app/core/data/moor_database.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // TODO
    return Text('TODO');
    //return Text('Cast: ${movie.castText}', style: Theme.of(context).textTheme.bodyText1);
  }
}
