import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/characters/characters_repository_provider.dart';

final nowCharactersProvider =
    StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  final fetchMoreCharacters =
      ref.watch(characterRepositoryProvider).getNowCharacters;
  return CharactersNotifier(fetchMoreCharacters: fetchMoreCharacters);
});
typedef CharacterCallback = Future<List<CharacterEntity>> Function({int page});

class CharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  CharacterCallback fetchMoreCharacters;

  CharactersNotifier({required this.fetchMoreCharacters}) : super([]);
  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<CharacterEntity> characters =
        await fetchMoreCharacters(page: currentPage);
    state = [...state, ...characters];
    isLoading = false;
  }
}
