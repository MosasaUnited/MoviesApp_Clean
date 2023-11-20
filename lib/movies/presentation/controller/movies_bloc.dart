import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/utilities/enums.dart';
import 'package:movie_clean/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      print(result);
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
