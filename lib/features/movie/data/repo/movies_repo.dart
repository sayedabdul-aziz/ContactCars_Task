import 'package:contactcars_task/core/services/failures/failure.dart';
import 'package:contactcars_task/features/movie/data/model/movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepo {
  Future<Either<Failure, MovieModel>> getPopularMovies({required int page});
}
