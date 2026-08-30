import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'downloads_bloc.freezed.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final iDownloadsRepo _downloadsRepo; // Note: Interface usually starts with uppercase 'I'

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      // 1. Emit loading state & reset option to None
      emit(state.copyWith(
        isLoading: true,
        downloadsFailureOrSuccessOption: const None(),
      ));

      // 2. Fetch data from repository
      final Either<MainFailure, Downloads> downloadsOption =
          await _downloadsRepo.getDownloadsImages();
      log(downloadsOption.toString() as num);


      // 3. Emit updated state with success or failure wrapped in Some()
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(Left(failure)),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(Right(success as List<Downloads>)),
          ),
        ),
      );
    });
  }
}