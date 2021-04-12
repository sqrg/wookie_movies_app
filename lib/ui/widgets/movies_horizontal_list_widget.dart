import 'package:flutter/material.dart';

import 'package:wookie_movies_app/core/data/moor_database.dart';

import 'package:wookie_movies_app/ui/widgets/movie_item_widget.dart';

class MoviesHorizontalList extends StatelessWidget {
  const MoviesHorizontalList({
    Key key,
    @required this.movies,
    @required this.onTap,
  }) : super(key: key);

  final List<Movie> movies;
  final Function(Movie) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int movieIndex) {
        Movie movie = movies[movieIndex];

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: MovieItemWidget(
            title: movie.title,
            posterUrl: movie.poster,
            onTap: () {
              onTap(movie);
            },
          ),
        );
      },
    );
  }
}