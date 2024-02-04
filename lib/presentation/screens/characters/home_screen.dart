import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/characters/characters_providers.dart';
import 'package:rick_and_morty_app_gtc/presentation/widgets/widgets.dart';

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
        body: Column(
      children: [
        
        const CustomAppBar(),
        CharacterVerticalListView(
          characters: nowCharacters,
          loadNextPage: () {
            ref.read(nowCharactersProvider.notifier).loadNextPage();
          },
        )
      ],
    ));
  }
}
