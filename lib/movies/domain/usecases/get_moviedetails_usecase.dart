import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/core/usecase/base_usecase.dart';
import 'package:movie_clean/movies/domain/entities/movie_details.dart';
import 'package:movie_clean/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails();
  }
}

// هنا لو عايز تضيف أكتر من model تجيب بيه الداتا
class MovieDetailsParameters extends Equatable {
  final int movieId;
  final String name;

  const MovieDetailsParameters(this.movieId, this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId, name];
}
