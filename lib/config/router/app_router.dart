import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app_gtc/presentation/screens/characters/character_screen.dart';
import 'package:rick_and_morty_app_gtc/presentation/screens/characters/home_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            path: 'character/:id',
            name: CharacterScreen.name,
            builder: (context, state) {
              final characterId = state.pathParameters['id'] ?? 'no-id';
              return CharacterScreen(characterId: characterId);
            })
      ]),
]);
