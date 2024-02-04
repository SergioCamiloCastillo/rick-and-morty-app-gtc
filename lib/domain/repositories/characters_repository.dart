import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getNowCharacters({int page = 1});
  Future<CharacterEntity> getCharacterById(String characterId);
  Future<List<CharacterEntity>> searchCharacters(String query);
}
