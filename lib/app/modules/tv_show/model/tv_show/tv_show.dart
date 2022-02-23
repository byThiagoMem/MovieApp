import '../../../../movie_design_system/commom/utils/arguments.dart';

class TvShow {
  final int id;
  final String title;
  final String overview;
  final String firstAirDate;
  final List<int> genreIds;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;

  TvShow({
    required this.id,
    required this.title,
    required this.overview,
    required this.firstAirDate,
    required this.genreIds,
    required this.voteAverage,
    required this.popularity,
    required this.posterPath,
    required this.backdropPath,
  });

  factory TvShow.fromMap(Map<String, dynamic> map) {
    return TvShow(
      id: map['id']?.toInt() ?? 0,
      title: map['name'] ?? '',
      overview: map['overview'] ?? '',
      firstAirDate: map['first_air_date'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] != null
          ? map['backdrop_path']
          : map['poster_path'] ?? '',
    );
  }

  static List<TvShow> fromMapList(Map<String, dynamic> json) =>
      List<TvShow>.from(json['results'].map((list) => TvShow.fromMap(list)));

  static List<ScreenData> fromListScreenData({required List<TvShow> movie}) => [
        ...movie
            .map((e) => ScreenData(
                id: e.id,
                title: e.title,
                overview: e.overview,
                releaseDate: e.firstAirDate,
                genreIds: e.genreIds,
                voteAverage: e.voteAverage,
                popularity: e.popularity,
                posterPath: e.posterPath,
                backdropPath: e.backdropPath))
            .toList(),
      ];
}
