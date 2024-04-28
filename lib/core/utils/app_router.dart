import 'package:contactcars_task/features/movie/data/model/result.dart';
import 'package:contactcars_task/features/movie/presentation/view/movie_details_view.dart';
import 'package:contactcars_task/features/movie/presentation/view/popular_movies_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const initialRoute = '/';
  static const movieDetailsRoute = '/movieDetailsRoute';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const PopularMoviesView(),
      ),
      GoRoute(
        path: movieDetailsRoute,
        builder: (context, state) {
          final movie = state.extra! as Results;
          return MovieDetailView(
            model: movie,
          );
        },
      ),
    ],
  );
}
