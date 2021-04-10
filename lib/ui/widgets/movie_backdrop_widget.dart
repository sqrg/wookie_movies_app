import 'package:flutter/material.dart';

import 'package:wookie_movies_app/core/models/movie.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({
    Key key,
    @required this.movie,
    @required this.backdropHeight,
    @required this.backdropWidth,
  }) : super(key: key);

  final Movie movie;
  final double backdropHeight;
  final double backdropWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.backdrop,
          height: backdropHeight,
          width: backdropWidth,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Row(
              children: [
                Flexible(flex: 1, child: Container()),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      '${movie.title} (${movie.imdbRating})',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
