import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetNowPlayingUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getNowPlaying();
  }
}
