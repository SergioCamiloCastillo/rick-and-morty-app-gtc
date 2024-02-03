import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';

abstract class CharactersDatasource {
  Future<List<CharacterEntity>> getNowCharacters({int page = 1});
}
