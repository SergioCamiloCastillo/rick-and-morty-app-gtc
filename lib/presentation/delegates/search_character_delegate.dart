import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/widgets/widgets.dart';

typedef SearchCharacterCallback = Future<List<CharacterEntity>> Function(
    String query);

class SearchCharacterDelegate extends SearchDelegate<CharacterEntity?> {
  StreamController<List<CharacterEntity>> debouncedCharacters =
      StreamController.broadcast();
  Timer? _debounceTimer;
  final SearchCharacterCallback searchCharacters;
  List<CharacterEntity> initialCharacters;
  SearchCharacterDelegate(
      {required this.searchCharacters, this.initialCharacters = const []});

  void clearStreams() {
    debouncedCharacters.close();
  }

  void _onQueryChange(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) return debouncedCharacters.add([]);
      final characters = await searchCharacters(query);
      debouncedCharacters.add(characters);
    });
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      initialData: initialCharacters,
      stream: debouncedCharacters.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _CharacterItem(
            character: movies[index],
            onCharacterSelected: (context, movie) {
              clearStreams();
              close(context, movie);
            },
          ),
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Buscar personaje';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChange(query);
    return buildResultsAndSuggestions();
  }
}

class _CharacterItem extends StatelessWidget {
  final CharacterEntity character;
  final Function onCharacterSelected;
  const _CharacterItem(
      {super.key, required this.character, required this.onCharacterSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onCharacterSelected(context, character);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              SizedBox(
                  width: size.width * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      character.imageUrl,
                      loadingBuilder: (context, child, loadingProgress) =>
                          FadeIn(child: child),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(character.name,
                          style: Theme.of(context).textTheme.headlineMedium),
                      Row(
                        children: [
                          PointStatus(
                            color: character.status == 'Alive'
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(character.status == 'Alive' ? 'Vivo' : 'Muerto',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                      Text(
                        character.species,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(character.location!['name'] ?? 'Desconocido',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ))
            ],
          )),
    );
  }
}
