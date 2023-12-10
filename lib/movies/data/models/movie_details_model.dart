import 'package:movie_clean/movies/data/models/genres_model.dart';
import 'package:movie_clean/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.overView,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        genres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
        backdropPath: json['backdropPath'],
        id: json['id'],
        overView: json['overView'],
        releaseDate: json['releaseDate'],
        runTime: json['runTime'],
        title: json['title'],
        voteAverage: json['voteAverage'],
      );
}
