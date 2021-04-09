import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wookie_movies_app/core/models/movie.dart';
import 'package:wookie_movies_app/core/viewmodels/movie_detail_viewmodel.dart';

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  MovieDetailView({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double backdropHeight = MediaQuery.of(context).size.height / 3;

    return ViewModelBuilder<MovieDetailViewModel>.reactive(
      viewModelBuilder: () => MovieDetailViewModel(),
      builder: (context, vm, child) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Image.network(
              movie.backdrop,
              height: backdropHeight,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
                margin: EdgeInsets.only(top: backdropHeight - 50, left: 25, right: 15),
                child: Image.network(
                  movie.poster,
                  height: 200,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
