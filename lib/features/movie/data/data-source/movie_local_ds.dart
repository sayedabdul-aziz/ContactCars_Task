import 'dart:convert';

import 'package:contactcars_task/core/constants/constants.dart';
import 'package:contactcars_task/core/services/failures/failure.dart';
import 'package:contactcars_task/features/movie/data/model/movie_model.dart';
import 'package:hive/hive.dart';

abstract class MoviesLocaleDataSource {
  Future<MovieModel> getCachedMovies();
  Future<void> cacheMovies(MovieModel movies);
}

class MoviesLocaleDataSourceImpl implements MoviesLocaleDataSource {
  MoviesLocaleDataSourceImpl();

  @override
  Future<void> cacheMovies(MovieModel moviesModels) async {
    final box = await Hive.openBox<String>(kMoviesBox);

    await box.clear();

    await box.add(json.encode(moviesModels.toJson()));

    await box.close();
  }

  @override
  Future<MovieModel> getCachedMovies() async {
    final box = await Hive.openBox<String>(kMoviesBox);

    if (box.isNotEmpty) {
      return MovieModel.fromJson(json.decode(box.getAt(0)!));
    } else {
      throw const Failure(
        exceptionType: 'No Data Found in cache',
      );
    }
  }
}
