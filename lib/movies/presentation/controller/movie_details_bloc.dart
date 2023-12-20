import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/utilities/enums.dart';
import 'package:movie_clean/movies/domain/entities/movie_details.dart';
import 'package:movie_clean/movies/domain/entities/recommendation.dart';
import 'package:movie_clean/movies/domain/usecases/get_moviedetails_usecase.dart';
import 'package:movie_clean/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailsParameters(
      movieId: event.id,
    ));

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameters(
      event.id,
    ));

    result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
