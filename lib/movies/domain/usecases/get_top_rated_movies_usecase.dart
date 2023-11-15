import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRated();
  }
}
