import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/utilities/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowplaying_message;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowplaying_message = '',
  });

  @override
  List<Object?> get props =>
      [nowPlayingMovies, nowPlayingState, nowplaying_message];
}
