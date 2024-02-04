import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: const Color(0xff033E46),
      effect: const ShimmerEffect(),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            6,
            (index) => Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: ListTile(
                  title: Text(
                    'Item number $index as title',
                    style: const TextStyle(color: Color(0xFF26565E)),
                  ),
                  subtitle: const Text('Subtitle here',
                      style: TextStyle(color: Color(0xFF26565E))),
                  leading: const Icon(
                    Icons.ac_unit,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
