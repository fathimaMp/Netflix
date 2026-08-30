part of 'downloads_bloc.dart';

@freezed
abstract class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    @Default(false) bool isLoading,
    @Default([]) List<Downloads> downloads,
    @Default(None()) Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.initial() => const DownloadsState(
    isLoading: false,
    downloads: [],
    downloadsFailureOrSuccessOption: None(),
  );
}