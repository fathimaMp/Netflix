import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const String trending = "$KBaseUrl/trending/all/day";
  static const String downloads = trending;
  static const String popularMovies = "$KBaseUrl/movie/popular";
  static const String popularTv = "$KBaseUrl/tv/popular";
  static const String upcomingMovies = "$KBaseUrl/movie/upcoming";
  static const String nowPlayingMovies = "$KBaseUrl/movie/now_playing";
  static const String topRatedTv = "$KBaseUrl/tv/top_rated";
  static const String discoverMovies = "$KBaseUrl/discover/movie";
  static const String discoverTv = "$KBaseUrl/discover/tv";
  static const String searchMulti = "$KBaseUrl/search/multi";
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static Map<String, dynamic> get defaultQueryParameters => {
        if (API_KEY.isNotEmpty) 'api_key': API_KEY,
      };
}
