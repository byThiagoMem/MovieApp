class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.voteAverage,
    required this.popularity,
    required this.posterPath,
    required this.backdropPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'releaseDate': releaseDate,
      'genreIds': genreIds,
      'voteAverage': voteAverage,
      'popularity': popularity,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['backdrop_path'],
      backdropPath: map['backdrop_path'] ?? '',
    );
  }

  static List<Movie> fromMapList(Map<String, dynamic> map) =>
      List<Movie>.from((map['results'] ?? []).map(Movie.fromMap));
}
