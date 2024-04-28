part of 'movie_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

// ---- Popular Movies states

final class GetPopularMoviesLoading extends MoviesState {}

final class GetPopularMoviesSuccess extends MoviesState {
  final MovieModel movieModel;

  GetPopularMoviesSuccess(this.movieModel);
}

// Failure State
final class MoviesFailure extends MoviesState {
  final Failure? failure;

  MoviesFailure({this.failure});
}
