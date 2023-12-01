import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/utilities/enums.dart';
import 'package:movie_clean/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean/movies/presentation/controller/movies_state.dart';

import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMovieUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase.execute();
    print(result);
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovieUseCase.execute();
    print(result);
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMoviesState: RequestState.error,
          topRatedMoviesMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMoviesState: RequestState.loaded,
        ),
      ),
    );
  }
}
