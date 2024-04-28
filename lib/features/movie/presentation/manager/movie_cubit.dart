import 'package:contactcars_task/core/services/failures/failure.dart';
import 'package:contactcars_task/features/movie/data/model/movie_model.dart';
import 'package:contactcars_task/features/movie/data/repo/movies_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MoviesState> {
  MovieCubit({
    required this.moviesRepo,
  }) : super(MoviesInitial());
  final MoviesRepo moviesRepo;

  Future<void> getPopularMovies({required int page}) async {
    emit(MoviesInitial());

    var result = await moviesRepo.getPopularMovies(page: page);
    result.fold(
      (failure) => emit(MoviesFailure(failure: failure)),
      (responseActivit) async {
        emit(GetPopularMoviesSuccess(responseActivit));
      },
    );
  }
}

MovieCubit getMovieCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<MovieCubit>(context, listen: listen);
