class CatalogTitle {
  const CatalogTitle({
    required this.id,
    required this.name,
    required this.mediaType,
    this.posterPath,
    this.backdropPath,
    this.overview = '',
    this.releaseDate = '',
    this.voteAverage = 0,
  });

  final int id;
  final String name;
  final String mediaType;
  final String? posterPath;
  final String? backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  String? get posterUrl => _imageUrl(posterPath);
  String? get backdropUrl => _imageUrl(backdropPath) ?? posterUrl;

  static String? _imageUrl(String? path) =>
      path == null || path.isEmpty ? null : 'https://image.tmdb.org/t/p/w500$path';

  factory CatalogTitle.fromJson(Map<String, dynamic> json) {
    final mediaType = json['media_type'] as String? ??
        (json.containsKey('first_air_date') || json.containsKey('name') && !json.containsKey('title')
            ? 'tv'
            : 'movie');
    final rawVote = json['vote_average'];
    return CatalogTitle(
      id: json['id'] as int? ?? 0,
      name: (json['title'] ?? json['name'] ?? 'Untitled').toString(),
      mediaType: mediaType,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String? ?? '',
      releaseDate: (json['release_date'] ?? json['first_air_date'] ?? '').toString(),
      voteAverage: rawVote is num ? rawVote.toDouble() : 0,
    );
  }
}
