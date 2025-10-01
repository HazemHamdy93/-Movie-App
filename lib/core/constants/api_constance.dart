class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'e4addbf3223eaf2bccd8f1144384a25e';
  static const String nowPlaying = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popular = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRated = '$baseUrl/movie/top_rated?api_key=$apiKey';
}
