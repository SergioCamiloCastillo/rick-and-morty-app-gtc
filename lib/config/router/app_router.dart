import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app_gtc/presentation/screens/characters/home_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  )
]);
