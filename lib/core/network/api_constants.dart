class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '6c5ee495cd0169545443e5e6bb8a639c';

  static const String nowPlayingMoviePath =
      '$baseUrl/now_playing/api_key=$apiKey';
  static const String getPopularPath = '$baseUrl/popular/api_key=$apiKey';
  static const String getTopRatedPath = '$baseUrl/top_rated/api_key=$apiKey';
}
