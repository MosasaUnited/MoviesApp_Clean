import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/core/usecase/base_usecase.dart';

import '../entities/recommendation.dart';
import '../repository/base_movie_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
