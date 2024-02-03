import 'package:rick_and_morty_app_gtc/infrastructure/models/characterdb/character_characterdb.dart';

class CharacterDbResponse {
  final Info info;
  final List<CharacterFromCharacterdb> results;

  CharacterDbResponse({
    required this.info,
    required this.results,
  });

  factory CharacterDbResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDbResponse(
        info: Info.fromJson(json["info"]),
        results: List<CharacterFromCharacterdb>.from(
            json["results"].map((x) => CharacterFromCharacterdb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"] ?? '',
        prev: json["prev"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
