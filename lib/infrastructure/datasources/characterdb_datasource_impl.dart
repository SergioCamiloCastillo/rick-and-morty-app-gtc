import 'package:dio/dio.dart';
import 'package:rick_and_morty_app_gtc/domain/datasources/characters_datasource.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/mappers/character_mapper.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/models/characterdb/character_details.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/models/characterdb/characterdb_response.dart';

class CharacterDBDatasource extends CharactersDatasource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/character'));
  Future<int> getTotalPages() async {
    final response = await dio.get('');
    return response.data['info']['pages'];
  }

  @override
  Future<List<CharacterEntity>> getNowCharacters({int page = 1}) async {
    try {
      final getTotalPages = await this.getTotalPages();
      if (page > getTotalPages) return [];
      final response = await dio.get('?page=$page');

      final characterDBResponse = CharacterDbResponse.fromJson(response.data);

      final List<CharacterEntity> characters = characterDBResponse.results
          .map((item) => CharacterMapper.characterDBToEntity(item))
          .toList();
      return characters;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      } else {
        throw Exception('Error de red al obtener personajes');
      }
    }
  }

  @override
  Future<CharacterEntity> getCharacterById(String characterId) async {
    try {
      final response = await dio.get('/$characterId');

      final characterDetail = CharacterDetail.fromJson(response.data);
      final character =
          CharacterMapper.characterDetailsToEntity(characterDetail);
      return character;
    } on DioException catch (e) {
      if (e.response?.statusCode != 200) {
        throw Exception('Error al obtener respuesta de personaje por id');
      } else {
        throw Exception('Error de red al obtener personaje');
      }
    }
  }

  List<CharacterEntity> _jsonToCharacters(Map<String, dynamic> json) {
    final characterDBResponse = CharacterDbResponse.fromJson(json);

    final List<CharacterEntity> characters = characterDBResponse.results
        .map((characterDB) => CharacterMapper.characterDBToEntity(characterDB))
        .toList();

    return characters;
  }

  @override
  Future<List<CharacterEntity>> searchCharacters(String query) async {
    if (query.isEmpty) return [];
    final response = await dio.get('/?name=$query');
    return _jsonToCharacters(response.data);
  }
}
