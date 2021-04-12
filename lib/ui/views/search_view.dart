import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:wookie_movies_app/core/models/movie_api_response.dart';
import 'package:wookie_movies_app/core/viewmodels/search_viewmodel.dart';

import 'package:wookie_movies_app/ui/widgets/fullscreen_loading_widget.dart';
import 'package:wookie_movies_app/ui/widgets/movie_search_item_widget.dart';
import 'package:wookie_movies_app/ui/widgets/text_entry_widget.dart';

class SearchView extends StatelessWidget {
  SearchView({Key key}) : super(key: key);

  final TextEditingController searchTerm = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: TextEntryWidget(
                            controller: searchTerm,
                            onChanged: (String newString) {
                              if (newString == '') {
                                vm.clearMovies();
                              }
                            },
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await vm.searchMovies(searchTerm.text);
                        },
                        child: Text('Buscar'),
                      ),
                    ],
                  ),
                  vm.movies.length == 0
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text('No hay resultados'),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: vm.movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              MovieApiResponse movie = vm.movies[index];

                              return GestureDetector(
                                onTap: () => vm.navigateToMovieDetail(movie),
                                child: Container(margin: EdgeInsets.symmetric(vertical: 10), child: MovieSearchItemWidget(movie: movie)),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
            vm.isBusy ? FullScreenLoadingWidget() : Container(),
          ],
        ),
      ),
    );
  }
}
