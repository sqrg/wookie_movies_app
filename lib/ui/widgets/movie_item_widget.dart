import 'package:flutter/material.dart';

import 'package:wookie_movies_app/core/models/movie.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key key,
    @required this.movie,
    @required this.onTap,
  }) : super(key: key);

  final Movie movie;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Image.network(movie.poster),
      ),
    );
  }
}
