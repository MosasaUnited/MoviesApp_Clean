import 'package:dio/dio.dart';
import 'package:movie_clean/core/error/exceptions.dart';
import 'package:movie_clean/core/network/error_message_model.dart';
import 'package:movie_clean/movies/data/models/movie_model.dart';

import '../../domain/entities/movie.dart';

class MovieRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=6c5ee495cd0169545443e5e6bb8a639c&language=en-US&page=1');

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
