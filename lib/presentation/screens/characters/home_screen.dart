import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/characters/characters_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(nowCharactersProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowCharacters = ref.watch(nowCharactersProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Personajes',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: ListView.builder(
            itemCount: nowCharacters.length,
            itemBuilder: (context, index) {
              final character = nowCharacters[index];

              return ListTile(
                title: Text(character.name),
                subtitle: Text(character.status),
                leading: Image.network(character.imageUrl),
              );
            }));
  }
}
