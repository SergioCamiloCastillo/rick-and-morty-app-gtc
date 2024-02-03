import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/models/characterdb/character_characterdb.dart';

class CharacterMapper {
  static CharacterEntity characterDBToEntity(
          CharacterFromCharacterdb characterdb) =>
      CharacterEntity(
          id: characterdb.id,
          name: characterdb.name,
          status: characterdb.status,
          species: characterdb.species,
          gender: characterdb.gender,
          type: characterdb.type,
          imageUrl: characterdb.image ??
              'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg');
}
