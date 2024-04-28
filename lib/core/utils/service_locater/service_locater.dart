import 'package:contactcars_task/features/movie/data/data-source/movie_local_ds.dart';
import 'package:contactcars_task/features/movie/data/data-source/movie_remote_ds.dart';
import 'package:contactcars_task/features/movie/data/repo/movies_repo.dart';
import 'package:contactcars_task/features/movie/data/repo/movies_repo_impl.dart';
import 'package:contactcars_task/features/movie/presentation/manager/movie_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../network/network_connection_checker.dart';
import '../../services/api_services_dio.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //! Features

  //* Cubit
  sl.registerFactory(() => MovieCubit(moviesRepo: sl()));

  //* Repos
  sl.registerLazySingleton<MoviesRepo>(() => MoviesRepoImpl(
      remoteDataSource: sl(),
      localeDataSource: sl(),
      networkConnectionChecker: sl()));
// Datasources
  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(dioApiServices: sl()));
  sl.registerLazySingleton<MoviesLocaleDataSource>(
      () => MoviesLocaleDataSourceImpl());

  //! Core
  //ApiService
  sl.registerLazySingleton<DioApiServices>(
      () => DioApiServices(dio: sl<Dio>()));
  //NetworkConnectionChecker
  sl.registerLazySingleton<CheckInternet>(() => CheckInternetImpl(sl()));

  //! External
  //ex: Dio, etc...
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  Hive.initFlutter();
}
