//read provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/datasources/characterdb_datasource_impl.dart';
import 'package:rick_and_morty_app_gtc/infrastructure/repositories/character_repository_impl.dart';

//este repositorio es inmutable, solo de lectura
final characterRepositoryProvider = Provider((ref) {
  return CharacterRepositoryImpl(datasource: CharacterDBDatasource());
});
