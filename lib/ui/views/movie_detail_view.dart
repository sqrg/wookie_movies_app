import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:wookie_movies_app/core/data/moor_database.dart';
import 'package:wookie_movies_app/core/viewmodels/movie_detail_viewmodel.dart';

import 'package:wookie_movies_app/ui/widgets/movie_backdrop_widget.dart';
import 'package:wookie_movies_app/ui/widgets/movie_cast_widget.dart';
import 'package:wookie_movies_app/ui/widgets/movie_poster_widget.dart';
import 'package:wookie_movies_app/ui/widgets/movie_short_info_widget.dart';
import 'package:wookie_movies_app/ui/widgets/movie_star_rating_widget.dart';

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  MovieDetailView({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double backdropHeight = MediaQuery.of(context).size.height / 3;
    double backdropWidth = MediaQuery.of(context).size.width;
    double posterHeight = 220;

    int starRating = imdbRatingToStarRating(movie.imdbRating);

    return ViewModelBuilder<MovieDetailViewModel>.reactive(
      viewModelBuilder: () => MovieDetailViewModel(),
      builder: (context, vm, child) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              MovieBackdropWidget(movie: movie, backdropHeight: backdropHeight, backdropWidth: backdropWidth),
              Container(
                margin: EdgeInsets.only(top: backdropHeight - (posterHeight / 2), left: 15, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: MoviePosterWidget(
                              posterUrl: movie.poster,
                              height: posterHeight,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Center(
                              child: MovieStarRatingWidget(starRating),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: MovieShortInfoWidget(movie: movie),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: MovieCastWidget(movie: movie),
                    ),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int imdbRatingToStarRating(double imdbRating) {
    if (imdbRating >= 9) return 5;
    if (imdbRating >= 7) return 4;
    if (imdbRating >= 5) return 3;
    if (imdbRating >= 3) return 2;
    return 1;
  }

  String castText() {
    String tempString = '';

    /*for (var person in cast) {
      tempString += '$person, ';
    }
    */

    return tempString.substring(0, tempString.length - 2);
  }
}
