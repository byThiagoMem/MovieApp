class Crew {
  final int id;
  final String name;
  final String profilePath;
  final String character;
  final int order;

  Crew({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  factory Crew.fromMap(Map<String, dynamic> map) {
    return Crew(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      profilePath: map['profile_path'] ?? '',
      character: map['character'] ?? '',
      order: map['order'] ?? '',
    );
  }

  static List<Crew> fromMapList(Map<String, dynamic> json) =>
      List<Crew>.from(json['cast'].map((list) => Crew.fromMap(list)));
}
