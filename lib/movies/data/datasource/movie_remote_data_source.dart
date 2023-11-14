import 'package:dio/dio.dart';
import 'package:movie_clean/core/error/exceptions.dart';
import 'package:movie_clean/core/network/error_message_model.dart';
import 'package:movie_clean/movies/data/models/movie_model.dart';

import '../../../core/network/api_constants.dart';
import '../../domain/entities/movie.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() {}
}
