import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

@LazySingleton(as : iDownloadsRepo)
class DownloadsRepository implements iDownloadsRepo {
  @override
  Future<Either<MainFailure, Downloads>> getDownloadsImages() async {
    try {
        final Response response = await Dio(BaseOptions()).get(ApiEndPoints.downloads);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final List<Downloads> downloadsList = [];
          for (final raw in response.data){
            downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
            print(downloadsList);
            return Right(downloadsList as Downloads);
          }
        } else {
          return const Left(MainFailure.serverFailure());
        }
        return const Left(MainFailure.serverFailure());
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
  // Implementation of the DownloadsRepository class
}