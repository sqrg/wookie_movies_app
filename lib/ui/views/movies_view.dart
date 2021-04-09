import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wookie_movies_app/app.router.dart';
import 'package:wookie_movies_app/core/models/movie.dart';
import 'package:wookie_movies_app/core/viewmodels/movies_viewmodel.dart';
import 'package:wookie_movies_app/ui/widgets/movie_item_widget.dart';

class MoviesView extends StatelessWidget {
  MoviesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoviesViewModel>.reactive(
      viewModelBuilder: () => MoviesViewModel(),
      onModelReady: (vm) async {
        await vm.initialize();
      },
      builder: (context, vm, child) => Scaffold(
        body: SafeArea(
          child: Container(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  Movie movie = vm.movies[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: MovieItemWidget(
                      movie: movie,
                      onTap: () {
                        vm.goToMovieDetail(movie);
                      },
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
