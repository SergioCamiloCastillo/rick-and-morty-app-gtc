import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/delegates/search_character_delegate.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xff033E46),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rick and Morty APP',
                      style: Theme.of(context).textTheme.displayLarge),
                  GestureDetector(
                    onTap: () {
                      final searchCharacters =
                          ref.read(searchCharactersProvider);
                      final searchQuery = ref.read(searchQueryProvider);
                      showSearch<CharacterEntity?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchCharacterDelegate(
                            initialCharacters: searchCharacters,
                            searchCharacters: ref
                                .read(searchCharactersProvider.notifier)
                                .searchCharactersByQuery,
                          )).then((characterItem) {
                        if (characterItem == null) return;
                        context.push('/character/${characterItem.id}');
                      });
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Personajes',
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      )),
    );
  }
}
