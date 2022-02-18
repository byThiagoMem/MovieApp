import 'dart:convert';

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
  final String? tvName;
  final String? tvRelease;
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
    this.tvName,
    this.tvRelease,
  });

  static List<Movie> fromMapList(Map<String, dynamic> map) =>
      List<Movie>.from((map['results'] ?? []).map(Movie.fromMap));

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
      'tvName': tvName,
      'tvRelease': tvRelease,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      genreIds: List<int>.from(map['genreIds']),
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['posterPath'] ?? '',
      backdropPath: map['backdropPath'] ?? '',
      tvName: map['tvName'],
      tvRelease: map['tvRelease'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
