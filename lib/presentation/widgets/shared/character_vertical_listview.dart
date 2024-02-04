import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/providers.dart';
import 'package:rick_and_morty_app_gtc/presentation/widgets/widgets.dart';

class CharacterVerticalListView extends ConsumerStatefulWidget {
  final List<CharacterEntity> characters;
  final VoidCallback? loadNextPage;

  const CharacterVerticalListView(
      {super.key, required this.characters, this.loadNextPage});

  @override
  _CharacterVerticalListViewState createState() =>
      _CharacterVerticalListViewState();
}

class _CharacterVerticalListViewState
    extends ConsumerState<CharacterVerticalListView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.separated(
          controller: scrollController,
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: widget.characters.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final character = widget.characters[index];
            return GestureDetector(
              onTap: () => context.push("/character/${character.id}"),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Ajusta el radio según tus preferencias
                ),
                color: const Color(0xFF26565E),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  title: Text(character.name,
                      style: Theme.of(context).textTheme.headlineMedium),
                  subtitle: Row(
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
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      character.imageUrl,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return FadeIn(child: child);
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
