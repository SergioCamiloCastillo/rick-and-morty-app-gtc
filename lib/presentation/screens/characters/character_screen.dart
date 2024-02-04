import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/characters/character_info_provider.dart';
import 'package:rick_and_morty_app_gtc/presentation/widgets/shared/character_row_data.dart';
import 'package:rick_and_morty_app_gtc/presentation/widgets/widgets.dart';

class CharacterScreen extends ConsumerStatefulWidget {
  static const name = 'character_screen';
  final String characterId;
  const CharacterScreen({super.key, required this.characterId});

  @override
  CharacterScreenState createState() => CharacterScreenState();
}

class CharacterScreenState extends ConsumerState<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(characterInfoProvider.notifier).loadCharacter(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    final character = ref.watch(characterInfoProvider)[widget.characterId];
    if (character == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }
    return Scaffold(
        body: Center(
            child: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        _CustomSliverAppbar(
          character: character,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _CharacterDetail(
                      character: character,
                    ),
                childCount: 1))
      ],
    )));
  }
}

class _CharacterDetail extends StatelessWidget {
  final CharacterEntity character;
  const _CharacterDetail({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          CharacterRowData(
              label: 'Estado:',
              value: Row(
                children: [
                  PointStatus(
                    color:
                        character.status == 'Alive' ? Colors.green : Colors.red,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(character.status == 'Alive' ? 'Vivo' : 'Muerto',
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              )),
          CharacterRowData(
              label: 'Especie:',
              value: Text(character.species,
                  style: Theme.of(context).textTheme.bodyMedium)),
          CharacterRowData(
              label: 'Genero:',
              value: Text(character.gender,
                  style: Theme.of(context).textTheme.bodyMedium)),
          CharacterRowData(
              label: 'Ubicación:',
              value: Text(character.location!['name'] ?? 'Desconocido',
                  style: Theme.of(context).textTheme.bodyMedium)),
          CharacterRowData(
              label: 'Número de episodios:',
              value: Text(character.episodes!.length.toString(),
                  style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {
  final CharacterEntity character;
  const _CustomSliverAppbar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: size.height * 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          title: Text(
            character.name,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.start,
          ),
          background: Stack(children: [
            SizedBox.expand(
              child: Image.network(
                character.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return FadeIn(child: child);
                },
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.4],
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
