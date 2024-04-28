import 'package:contactcars_task/core/network/network_connection_checker.dart';
import 'package:contactcars_task/core/services/failures/failure.dart';
import 'package:contactcars_task/core/services/failures/failure_functions.dart';
import 'package:contactcars_task/features/movie/data/data-source/movie_local_ds.dart';
import 'package:contactcars_task/features/movie/data/data-source/movie_remote_ds.dart';
import 'package:contactcars_task/features/movie/data/model/movie_model.dart';
import 'package:contactcars_task/features/movie/data/repo/movies_repo.dart';
import 'package:dartz/dartz.dart';

class MoviesRepoImpl implements MoviesRepo {
  final CheckInternet networkConnectionChecker;
  final MoviesLocaleDataSource localeDataSource;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepoImpl({
    required this.networkConnectionChecker,
    required this.localeDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, MovieModel>> getPopularMovies(
      {required int page}) async {
    if (await networkConnectionChecker.isConnected) {
      try {
        // ----- get all movies and caching it to get it offline
        var remoteRepos = await remoteDataSource.getPopularMovies(page: page);
        localeDataSource.cacheMovies(remoteRepos);
        return Right(remoteRepos);
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      try {
        var cachedPosts = await localeDataSource.getCachedMovies();
        return Right(cachedPosts);
      } catch (e) {
        return Left(handleError(e));
      }
    }
  }
}
