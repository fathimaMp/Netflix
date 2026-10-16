import 'package:dio/dio.dart';
import 'package:netflix_app/domain/api_end_points.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

/// Reads movie and TV metadata from TMDB. Requires a TMDB v3 API key supplied
/// with --dart-define=TMDB_API_KEY=... at app launch.
class TmdbCatalogRepository {
  TmdbCatalogRepository({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<List<CatalogTitle>> trending({String window = 'day'}) =>
      _getTitles('${ApiEndPoints.trending.replaceFirst('/day', '/$window')}');

  Future<List<CatalogTitle>> popularMovies() =>
      _getTitles(ApiEndPoints.popularMovies);

  Future<List<CatalogTitle>> upcomingMovies() =>
      _getTitles(ApiEndPoints.upcomingMovies);

  Future<List<CatalogTitle>> releasedPastYear() {
    final today = DateTime.now();
    final yearAgo = DateTime(today.year - 1, today.month, today.day);
    final date = '${yearAgo.year.toString().padLeft(4, '0')}-'
        '${yearAgo.month.toString().padLeft(2, '0')}-'
        '${yearAgo.day.toString().padLeft(2, '0')}';
    return _getTitles(ApiEndPoints.discoverMovies, queryParameters: {
      'sort_by': 'popularity.desc',
      'primary_release_date.gte': date,
      'include_adult': false,
    });
  }

  Future<List<CatalogTitle>> popularTv() => _getTitles(ApiEndPoints.popularTv);

  Future<List<CatalogTitle>> topRatedTv() => _getTitles(ApiEndPoints.topRatedTv);

  Future<List<CatalogTitle>> popularTvInIndia() =>
      _getTitles(ApiEndPoints.discoverTv, queryParameters: {
        'sort_by': 'popularity.desc',
        'with_origin_country': 'IN',
      });

  Future<List<CatalogTitle>> search(String query) async {
    final term = query.trim();
    if (term.isEmpty) return const [];
    final results = await _getTitles(ApiEndPoints.searchMulti, queryParameters: {
      'query': term,
      'include_adult': false,
    });
    return results.where((title) => title.mediaType != 'person').toList(growable: false);
  }

  Future<List<CatalogTitle>> _getTitles(
    String url, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    if (API_KEY.isEmpty) {
      throw const TmdbRequestException(
        'TMDB API key is missing. Start Flutter with --dart-define=TMDB_API_KEY=your_key.',
      );
    }

    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: {
          ...ApiEndPoints.defaultQueryParameters,
          ...queryParameters,
        },
      );
      final data = response.data;
      if (data is! Map || data['results'] is! List) {
        throw const TmdbRequestException('TMDB returned an unexpected response.');
      }
      return (data['results'] as List)
          .whereType<Map>()
          .map((item) => CatalogTitle.fromJson(Map<String, dynamic>.from(item)))
          .where((item) => item.id != 0)
          .toList(growable: false);
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      if (status == 401 || status == 403) {
        throw const TmdbRequestException(
          'TMDB rejected the API key. Check that it is the v3 API key and is active.',
        );
      }
      if (status != null) {
        throw TmdbRequestException('TMDB request failed (HTTP $status).');
      }
      throw const TmdbRequestException(
        'Could not reach TMDB. Check the internet connection and try again.',
      );
    }
  }
}

class TmdbRequestException implements Exception {
  const TmdbRequestException(this.message);
  final String message;

  @override
  String toString() => message;
}
