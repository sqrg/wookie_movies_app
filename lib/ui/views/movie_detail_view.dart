import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wookie_movies_app/core/models/movie.dart';
import 'package:wookie_movies_app/core/viewmodels/movie_detail_viewmodel.dart';
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

    return ViewModelBuilder<MovieDetailViewModel>.reactive(
      viewModelBuilder: () => MovieDetailViewModel(),
      builder: (context, vm, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(
                movie.backdrop,
                height: backdropHeight,
                width: backdropWidth,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(top: backdropHeight - (posterHeight / 2), left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MoviePosterWidget(posterUrl: movie.poster, height: posterHeight),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${movie.title} (${movie.imdbRating})',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              MovieStarRatingWidget(3),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: MovieShortInfoWidget(movie: movie),
                    ),
                    Text('Cast: ${movie.cast}'),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
