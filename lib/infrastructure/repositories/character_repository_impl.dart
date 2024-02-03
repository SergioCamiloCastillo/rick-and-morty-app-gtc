import 'package:rick_and_morty_app_gtc/domain/datasources/characters_datasource.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl extends CharactersRepository {
  final CharactersDatasource datasource;

  CharacterRepositoryImpl({required this.datasource});
  @override
  Future<List<CharacterEntity>> getNowCharacters({int page = 1}) {
    return datasource.getNowCharacters(page: page);
  }
}
