import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/providers.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final searchCharactersProvider =
    StateNotifierProvider<SearchCharactersNotifier, List<CharacterEntity>>(
        (ref) {
  final characterRepository = ref.watch(characterRepositoryProvider);
  return SearchCharactersNotifier(
      searchCharacters: characterRepository.searchCharacters, ref: ref);
});

typedef SearchCharactersCallback = Future<List<CharacterEntity>> Function(
    String query);

class SearchCharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  SearchCharactersCallback searchCharacters;
  final Ref ref;

  SearchCharactersNotifier({required this.searchCharacters, required this.ref})
      : super([]);

  Future<List<CharacterEntity>> searchCharactersByQuery(String query) async {
    final List<CharacterEntity> characters = await searchCharacters(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = characters;
    return characters;
  }
}
