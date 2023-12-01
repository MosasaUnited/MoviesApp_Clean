class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '6c5ee495cd0169545443e5e6bb8a639c';

  static const String getNowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String getPopularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String getTopRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
