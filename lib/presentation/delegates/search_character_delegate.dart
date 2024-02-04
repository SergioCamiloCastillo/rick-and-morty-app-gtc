import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';

typedef SearchCharacterCallback = Future<List<CharacterEntity>> Function(
    String query);

class SearchCharacterDelegate extends SearchDelegate<CharacterEntity?> {
  final SearchCharacterCallback searchCharacters;
  SearchCharacterDelegate({required this.searchCharacters});
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
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchCharacters(query),
        initialData: const [],
        builder: (context, snapshot) {
          final characters = snapshot.data ?? [];
          return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  title: Text(character.name),
                );
              });
        });
  }
}
