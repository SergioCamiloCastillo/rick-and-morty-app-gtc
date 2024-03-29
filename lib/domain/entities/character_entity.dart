class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String imageUrl;
  final Map<String, String>? location;
  List<String>? episodes;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.imageUrl,
    this.location = const {},
    this.episodes = const [],
  });
}
