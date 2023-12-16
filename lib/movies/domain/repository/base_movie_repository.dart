import 'package:dartz/dartz.dart';
import 'package:movie_clean/movies/domain/usecases/get_moviedetails_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';
import '../usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameter);
}
