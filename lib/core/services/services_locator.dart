import 'package:get_it/get_it.dart';
import 'package:movie_clean/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_clean/movies/data/repository/movies_repository.dart';
import 'package:movie_clean/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_clean/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/repository/base_movie_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    ///Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
