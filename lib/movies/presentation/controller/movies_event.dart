import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetPopularMoviesEvent extends MoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetTopRatedMoviesEvent extends MoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
