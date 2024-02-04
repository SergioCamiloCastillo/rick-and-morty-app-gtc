import 'package:flutter/material.dart';

class PointStatus extends StatelessWidget {
  final Color color;
  const PointStatus({super.key, this.color = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9.0, // Ancho del círculo
      height: 9.0, // Altura del círculo
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
