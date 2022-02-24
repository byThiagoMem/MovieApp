import '../../../../movie_design_system/commom/utils/arguments.dart';

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

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'] != null ? map['backdrop_path'] : map['poster_path'] ?? '',
    );
  }

  static List<Movie> fromMapList(Map<String, dynamic> json) => List<Movie>.from(json['results'].map((list) => Movie.fromMap(list)));

  static List<ScreenData> fromListScreenData({required List<Movie> movie}) => [
        ...movie
            .map(
              (e) => ScreenData(
                id: e.id,
                title: e.title,
                overview: e.overview,
                releaseDate: e.releaseDate,
                genreIds: e.genreIds,
                voteAverage: e.voteAverage,
                popularity: e.popularity,
                posterPath: e.posterPath,
                backdropPath: e.backdropPath,
                isMovie: true,
              ),
            )
            .toList(),
      ];
}
