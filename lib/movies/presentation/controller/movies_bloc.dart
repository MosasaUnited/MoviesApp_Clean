import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/utilities/enums.dart';
import 'package:movie_clean/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_clean/movies/data/repository/movies_repository.dart';
import 'package:movie_clean/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean/movies/presentation/controller/movies_state.dart';

import '../../domain/repository/base_movie_repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository =
          MoviesRepository(baseMovieRemoteDataSource);
      final result =
          await GetNowPlayingMoviesUseCase(baseMovieRepository).execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
                nowPlayingState: RequestState.error,
                nowplaying_message: l.message,
              )),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
