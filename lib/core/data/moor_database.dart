import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get overview => text().withLength(min: 1, max: 1000)();
  TextColumn get poster => text().withLength(min: 1, max: 300)();
  TextColumn get backdrop => text().withLength(min: 1, max: 300)();
  RealColumn get imdbRating => real()();
  DateTimeColumn get releasedOn => dateTime().nullable()();
  TextColumn get length => text().withLength(min: 1, max: 20)();
  TextColumn get genres => text().withLength(min: 1, max: 100).nullable()();
  TextColumn get cast => text().withLength(min: 1, max: 200).nullable()();
  TextColumn get directors => text().withLength(min: 1, max: 200).nullable()();
}

@UseMoor(tables: [Movies])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  // Queries
  Future<List<Movie>> getAllMovies() => select(movies).get();

  Future<Movie> getMovieByTitle(String title) => (select(movies)..where((m) => m.title.equals(title))).getSingleOrNull();

  Future<List<Movie>> getMoviesByGenre(String genre) => (select(movies)..where((m) => m.genres.like('%$genre%'))).get();

  Future insertMovie(Movie movie) => into(movies).insert(movie);

  Future insertOrUpdateMovie(Movie movie) async {
    var m = await getMovieByTitle(movie.title);

    if (m == null) {
      return into(movies).insert(movie);
    }

    return null;
  }

  Future insertMovies(List<Movie> moviesToInsert) async {
    await batch((batch) {
      batch.insertAll(movies, moviesToInsert);
    });
  }
}
