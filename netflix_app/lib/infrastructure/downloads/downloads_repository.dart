import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

@LazySingleton(as : iDownloadsRepo)
class DownloadsRepository implements iDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    // TMDB rejects requests without an API key. Return a failure instead of
    // silently treating the response as an empty list.
    if (API_KEY.isEmpty) {
      return const Left(MainFailure.serverFailure());
    }
    try {
      final response = await Dio().get<dynamic>(
        ApiEndPoints.downloads,
        queryParameters: ApiEndPoints.defaultQueryParameters,
      );
      if (response.statusCode != 200 || response.data is! Map<String, dynamic>) {
        return const Left(MainFailure.serverFailure());
      }

      final results = response.data['results'];
      if (results is! List) {
        return const Left(MainFailure.serverFailure());
      }

      final downloads = results
          .whereType<Map<String, dynamic>>()
          .map(Downloads.fromJson)
          .where((item) => item.posterPath != null && item.posterPath!.isNotEmpty)
          .toList(growable: false);
      return Right(downloads);
    } on DioException catch (error) {
      if (error.response != null) {
        return const Left(MainFailure.serverFailure());
      }
      return const Left(MainFailure.clientFailure());
    } catch (_) {
      return const Left(MainFailure.serverFailure());
    }
  }
}
