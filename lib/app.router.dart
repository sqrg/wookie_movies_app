// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'core/models/movie.dart';
import 'ui/views/main_view.dart';
import 'ui/views/movie_detail_view.dart';

class Routes {
  static const String mainView = '/';
  static const String movieDetailView = '/movie-detail-view';
  static const all = <String>{
    mainView,
    movieDetailView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.movieDetailView, page: MovieDetailView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
    MovieDetailView: (data) {
      var args = data.getArgs<MovieDetailViewArguments>(
        orElse: () => MovieDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MovieDetailView(
          key: args.key,
          movie: args.movie,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MovieDetailView arguments holder class
class MovieDetailViewArguments {
  final Key key;
  final Movie movie;
  MovieDetailViewArguments({this.key, this.movie});
}
