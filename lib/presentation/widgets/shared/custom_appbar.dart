import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Personajes',
                  style: Theme.of(context).textTheme.displayLarge),
              GestureDetector(
                onTap: () {
                  final characterRepository =
                      ref.read(characterRepositoryProvider);
                  showSearch(
                      context: context,
                      delegate: SearchCharacterDelegate(
                          searchCharacters:
                              characterRepository.searchCharacters));
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
