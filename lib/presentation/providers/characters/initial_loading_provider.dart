import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app_gtc/presentation/providers/characters/characters_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowChatacters = ref.watch(nowCharactersProvider).isEmpty;
  if (nowChatacters) return true;
  return false;
});
