import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/config/router/app_router.dart';
import 'package:rick_and_morty_app_gtc/config/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Rick and Morty App GTC',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
    );
  }
}
