class TvShowCrew {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  final int order;

  TvShowCrew({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  factory TvShowCrew.fromMap(Map<String, dynamic> map) {
    return TvShowCrew(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      profilePath: map['profile_path'] ?? '',
      character: map['character'] ?? '',
      order: map['order'] ?? '',
    );
  }

  static List<TvShowCrew> fromMapList(Map<String, dynamic> json) =>
      List<TvShowCrew>.from(
          json['cast'].map((list) => TvShowCrew.fromMap(list)));
}
