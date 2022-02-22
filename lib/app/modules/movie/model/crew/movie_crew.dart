class MovieCrew {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  final int order;

  MovieCrew({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  factory MovieCrew.fromMap(Map<String, dynamic> map) {
    return MovieCrew(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      profilePath: map['profile_path'] ?? '',
      character: map['character'] ?? '',
      order: map['order'] ?? '',
    );
  }

  static List<MovieCrew> fromMapList(Map<String, dynamic> json) =>
      List<MovieCrew>.from(json['cast'].map((list) => MovieCrew.fromMap(list)));
}
