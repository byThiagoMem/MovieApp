class ScreenArguments {
  final ScreenData screenData;

  ScreenArguments({
    required this.screenData,
  });
}

class ScreenData {
  final int id;

  final String title;

  final String overview;

  final String releaseDate;

  final List<int> genreIds;

  final double voteAverage;

  final double popularity;

  final String posterPath;

  final String backdropPath;

  ScreenData({
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
}
