import 'package:contactcars_task/core/constants/constants.dart';
import 'package:contactcars_task/core/services/api_services_dio.dart';
import 'package:contactcars_task/features/movie/data/model/movie_model.dart';
import 'package:dio/dio.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieModel> getPopularMovies({required int page});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final DioApiServices dioApiServices;

  MoviesRemoteDataSourceImpl({
    required this.dioApiServices,
  });
  @override
  Future<MovieModel> getPopularMovies({required int page}) async {
    final response = await dioApiServices.get(
        endPoint: '/movie/popular',
        query: {
          'language': '',
          'page': page,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $kApiKey',
          },
        ));
    return Future.value(MovieModel.fromJson(response));
  }
}
