import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/providers.dart';

final characterInfoProvider =
    StateNotifierProvider<CharacterMapNotifier, Map<String, CharacterEntity>>(
        (ref) {
  final characterRespository = ref.watch(characterRepositoryProvider);
  return CharacterMapNotifier(
      getCharacter: characterRespository.getCharacterById);
});

typedef GetMovieCallback = Future<CharacterEntity> Function(String characterId);

class CharacterMapNotifier extends StateNotifier<Map<String, CharacterEntity>> {
  final GetMovieCallback getCharacter;
  CharacterMapNotifier({required this.getCharacter}) : super({});
  Future<void> loadCharacter(String characterId) async {
    if (state[characterId] != null) return;
    print('realizando peticion id');
    final character = await getCharacter(characterId);
    state = {...state, characterId: character};
  }
}
