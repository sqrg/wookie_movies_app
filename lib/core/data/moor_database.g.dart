// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final String title;
  final String overview;
  final String poster;
  final String backdrop;
  final double imdbRating;
  final DateTime releasedOn;
  final String length;
  final String genres;
  Movie(
      {this.id,
      @required this.title,
      @required this.overview,
      @required this.poster,
      @required this.backdrop,
      @required this.imdbRating,
      this.releasedOn,
      @required this.length,
      this.genres});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Movie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      poster:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}poster']),
      backdrop: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop']),
      imdbRating: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}imdb_rating']),
      releasedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}released_on']),
      length:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}length']),
      genres:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}genres']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || poster != null) {
      map['poster'] = Variable<String>(poster);
    }
    if (!nullToAbsent || backdrop != null) {
      map['backdrop'] = Variable<String>(backdrop);
    }
    if (!nullToAbsent || imdbRating != null) {
      map['imdb_rating'] = Variable<double>(imdbRating);
    }
    if (!nullToAbsent || releasedOn != null) {
      map['released_on'] = Variable<DateTime>(releasedOn);
    }
    if (!nullToAbsent || length != null) {
      map['length'] = Variable<String>(length);
    }
    if (!nullToAbsent || genres != null) {
      map['genres'] = Variable<String>(genres);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      poster:
          poster == null && nullToAbsent ? const Value.absent() : Value(poster),
      backdrop: backdrop == null && nullToAbsent
          ? const Value.absent()
          : Value(backdrop),
      imdbRating: imdbRating == null && nullToAbsent
          ? const Value.absent()
          : Value(imdbRating),
      releasedOn: releasedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(releasedOn),
      length:
          length == null && nullToAbsent ? const Value.absent() : Value(length),
      genres:
          genres == null && nullToAbsent ? const Value.absent() : Value(genres),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      poster: serializer.fromJson<String>(json['poster']),
      backdrop: serializer.fromJson<String>(json['backdrop']),
      imdbRating: serializer.fromJson<double>(json['imdbRating']),
      releasedOn: serializer.fromJson<DateTime>(json['releasedOn']),
      length: serializer.fromJson<String>(json['length']),
      genres: serializer.fromJson<String>(json['genres']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'poster': serializer.toJson<String>(poster),
      'backdrop': serializer.toJson<String>(backdrop),
      'imdbRating': serializer.toJson<double>(imdbRating),
      'releasedOn': serializer.toJson<DateTime>(releasedOn),
      'length': serializer.toJson<String>(length),
      'genres': serializer.toJson<String>(genres),
    };
  }

  Movie copyWith(
          {int id,
          String title,
          String overview,
          String poster,
          String backdrop,
          double imdbRating,
          DateTime releasedOn,
          String length,
          String genres}) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        poster: poster ?? this.poster,
        backdrop: backdrop ?? this.backdrop,
        imdbRating: imdbRating ?? this.imdbRating,
        releasedOn: releasedOn ?? this.releasedOn,
        length: length ?? this.length,
        genres: genres ?? this.genres,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('poster: $poster, ')
          ..write('backdrop: $backdrop, ')
          ..write('imdbRating: $imdbRating, ')
          ..write('releasedOn: $releasedOn, ')
          ..write('length: $length, ')
          ..write('genres: $genres')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              overview.hashCode,
              $mrjc(
                  poster.hashCode,
                  $mrjc(
                      backdrop.hashCode,
                      $mrjc(
                          imdbRating.hashCode,
                          $mrjc(releasedOn.hashCode,
                              $mrjc(length.hashCode, genres.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.poster == this.poster &&
          other.backdrop == this.backdrop &&
          other.imdbRating == this.imdbRating &&
          other.releasedOn == this.releasedOn &&
          other.length == this.length &&
          other.genres == this.genres);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> overview;
  final Value<String> poster;
  final Value<String> backdrop;
  final Value<double> imdbRating;
  final Value<DateTime> releasedOn;
  final Value<String> length;
  final Value<String> genres;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.poster = const Value.absent(),
    this.backdrop = const Value.absent(),
    this.imdbRating = const Value.absent(),
    this.releasedOn = const Value.absent(),
    this.length = const Value.absent(),
    this.genres = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String overview,
    @required String poster,
    @required String backdrop,
    @required double imdbRating,
    this.releasedOn = const Value.absent(),
    @required String length,
    this.genres = const Value.absent(),
  })  : title = Value(title),
        overview = Value(overview),
        poster = Value(poster),
        backdrop = Value(backdrop),
        imdbRating = Value(imdbRating),
        length = Value(length);
  static Insertable<Movie> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> overview,
    Expression<String> poster,
    Expression<String> backdrop,
    Expression<double> imdbRating,
    Expression<DateTime> releasedOn,
    Expression<String> length,
    Expression<String> genres,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (poster != null) 'poster': poster,
      if (backdrop != null) 'backdrop': backdrop,
      if (imdbRating != null) 'imdb_rating': imdbRating,
      if (releasedOn != null) 'released_on': releasedOn,
      if (length != null) 'length': length,
      if (genres != null) 'genres': genres,
    });
  }

  MoviesCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> overview,
      Value<String> poster,
      Value<String> backdrop,
      Value<double> imdbRating,
      Value<DateTime> releasedOn,
      Value<String> length,
      Value<String> genres}) {
    return MoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      poster: poster ?? this.poster,
      backdrop: backdrop ?? this.backdrop,
      imdbRating: imdbRating ?? this.imdbRating,
      releasedOn: releasedOn ?? this.releasedOn,
      length: length ?? this.length,
      genres: genres ?? this.genres,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (poster.present) {
      map['poster'] = Variable<String>(poster.value);
    }
    if (backdrop.present) {
      map['backdrop'] = Variable<String>(backdrop.value);
    }
    if (imdbRating.present) {
      map['imdb_rating'] = Variable<double>(imdbRating.value);
    }
    if (releasedOn.present) {
      map['released_on'] = Variable<DateTime>(releasedOn.value);
    }
    if (length.present) {
      map['length'] = Variable<String>(length.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(genres.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('poster: $poster, ')
          ..write('backdrop: $backdrop, ')
          ..write('imdbRating: $imdbRating, ')
          ..write('releasedOn: $releasedOn, ')
          ..write('length: $length, ')
          ..write('genres: $genres')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 200);
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn('overview', $tableName, false,
        minTextLength: 1, maxTextLength: 1000);
  }

  final VerificationMeta _posterMeta = const VerificationMeta('poster');
  GeneratedTextColumn _poster;
  @override
  GeneratedTextColumn get poster => _poster ??= _constructPoster();
  GeneratedTextColumn _constructPoster() {
    return GeneratedTextColumn('poster', $tableName, false,
        minTextLength: 1, maxTextLength: 300);
  }

  final VerificationMeta _backdropMeta = const VerificationMeta('backdrop');
  GeneratedTextColumn _backdrop;
  @override
  GeneratedTextColumn get backdrop => _backdrop ??= _constructBackdrop();
  GeneratedTextColumn _constructBackdrop() {
    return GeneratedTextColumn('backdrop', $tableName, false,
        minTextLength: 1, maxTextLength: 300);
  }

  final VerificationMeta _imdbRatingMeta = const VerificationMeta('imdbRating');
  GeneratedRealColumn _imdbRating;
  @override
  GeneratedRealColumn get imdbRating => _imdbRating ??= _constructImdbRating();
  GeneratedRealColumn _constructImdbRating() {
    return GeneratedRealColumn(
      'imdb_rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releasedOnMeta = const VerificationMeta('releasedOn');
  GeneratedDateTimeColumn _releasedOn;
  @override
  GeneratedDateTimeColumn get releasedOn =>
      _releasedOn ??= _constructReleasedOn();
  GeneratedDateTimeColumn _constructReleasedOn() {
    return GeneratedDateTimeColumn(
      'released_on',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lengthMeta = const VerificationMeta('length');
  GeneratedTextColumn _length;
  @override
  GeneratedTextColumn get length => _length ??= _constructLength();
  GeneratedTextColumn _constructLength() {
    return GeneratedTextColumn('length', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _genresMeta = const VerificationMeta('genres');
  GeneratedTextColumn _genres;
  @override
  GeneratedTextColumn get genres => _genres ??= _constructGenres();
  GeneratedTextColumn _constructGenres() {
    return GeneratedTextColumn('genres', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        overview,
        poster,
        backdrop,
        imdbRating,
        releasedOn,
        length,
        genres
      ];
  @override
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview'], _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster')) {
      context.handle(_posterMeta,
          poster.isAcceptableOrUnknown(data['poster'], _posterMeta));
    } else if (isInserting) {
      context.missing(_posterMeta);
    }
    if (data.containsKey('backdrop')) {
      context.handle(_backdropMeta,
          backdrop.isAcceptableOrUnknown(data['backdrop'], _backdropMeta));
    } else if (isInserting) {
      context.missing(_backdropMeta);
    }
    if (data.containsKey('imdb_rating')) {
      context.handle(
          _imdbRatingMeta,
          imdbRating.isAcceptableOrUnknown(
              data['imdb_rating'], _imdbRatingMeta));
    } else if (isInserting) {
      context.missing(_imdbRatingMeta);
    }
    if (data.containsKey('released_on')) {
      context.handle(
          _releasedOnMeta,
          releasedOn.isAcceptableOrUnknown(
              data['released_on'], _releasedOnMeta));
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length'], _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    if (data.containsKey('genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['genres'], _genresMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Movie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}
