import 'package:flutter/material.dart';

import '../../../movies/data/datasource/movie_remote_data_source.dart';
import '../../../movies/data/repository/movies_repository.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../../movies/domain/repository/base_movie_repository.dart';
import '../../../movies/domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMovieRepository movieRepository =
        MoviesRepository(baseMovieRemoteDataSource);
    final result = await GetNowPlayingMoviesUseCase(movieRepository).execute();
    result.fold((l) => null, (list) {
      movies = list;
    });
    print(result);
  }
}
