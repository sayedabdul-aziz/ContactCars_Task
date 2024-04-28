import 'package:contactcars_task/features/movie/presentation/manager/movie_cubit.dart';
import 'package:contactcars_task/features/movie/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesView extends StatefulWidget {
  const PopularMoviesView({super.key});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  @override
  void initState() {
    context.read<MovieCubit>().getPopularMovies(page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
        ),
        body: BlocBuilder<MovieCubit, MoviesState>(
          builder: (context, state) {
            if (state is GetPopularMoviesSuccess) {
              var movies = state.movieModel;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Scrollbar(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 220,
                      ),
                      itemCount: movies.results?.length,
                      itemBuilder: (context, index) {
                        var movie = movies.results?[index];
                        return MovieItem(
                          imageUrl: movie?.backdropPath ?? "",
                          name: movie?.title ?? "",
                          date: movie?.releaseDate ?? "",
                        );
                      }),
                ),
              );
            } else if (state is MoviesFailure) {
              return Center(child: Text(state.failure?.errorMessage ?? ''));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
