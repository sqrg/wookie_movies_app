import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wookie_movies_app/core/viewmodels/search_viewmodel.dart';

class SearchView extends StatelessWidget {
  SearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, vm, child) => Scaffold(),
    );
  }
}
