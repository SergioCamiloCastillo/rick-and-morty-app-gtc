import 'package:dio/dio.dart';
import 'package:rick_and_morty_app_gtc/domain/datasources/characters_datasource.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/mappers/character_mapper.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/models/characterdb/characterdb_response.dart';

class CharacterDBDatasource extends CharactersDatasource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/character'));
  @override
  Future<List<CharacterEntity>> getNowCharacters({int page = 1}) async {
    final response = await dio.get('?page=$page');
    final characterDBResponse = CharacterDbResponse.fromJson(response.data);
    final List<CharacterEntity> characters = characterDBResponse.results
        .map((item) => CharacterMapper.characterDBToEntity(item))
        .toList();
    return characters;
  }
}
