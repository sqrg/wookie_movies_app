import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:wookie_movies_app/core/data/moor_database.dart';
import 'package:wookie_movies_app/core/viewmodels/movies_viewmodel.dart';

import 'package:wookie_movies_app/ui/widgets/fullscreen_loading_widget.dart';
import 'package:wookie_movies_app/ui/widgets/movies_horizontal_list_widget.dart';

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
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, left: 15),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        await vm.refreshMovies();
                      },
                      child: Text('Refrescar'),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: vm.moviesGroupedByGenre.keys.length,
                          itemBuilder: (BuildContext context, int genreIndex) {
                            String genre = vm.moviesGroupedByGenre.keys.elementAt(genreIndex);
                            List<Movie> movies = vm.moviesGroupedByGenre[genre];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      genre,
                                      style: Theme.of(context).textTheme.headline1,
                                    )),
                                SizedBox(
                                  height: 200,
                                  child: MoviesHorizontalList(
                                    movies: movies,
                                    onTap: (Movie m) {
                                      vm.navigateToMovieDetail(m);
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
              vm.isBusy ? FullScreenLoadingWidget() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
