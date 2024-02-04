import 'package:flutter/material.dart';
import 'package:rick_and_morty_app_gtc/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app_gtc/presentation/widgets/widgets.dart';

class CharacterRowData extends StatelessWidget {
  final String label;
  final Widget value;
  const CharacterRowData({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(
            width: 8,
          ),
          value
        ],
      ),
    );
  }
}
