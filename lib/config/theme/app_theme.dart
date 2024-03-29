import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme {
    Color appColorSeed = const Color(0xff033E46); 
    Color colorTextDefault = Colors.white;
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff033E46),
        scaffoldBackgroundColor: const Color(0xff033E46),
        appBarTheme: AppBarTheme(
          backgroundColor: appColorSeed,
        ),
        textTheme: const TextTheme(
                //h1
                displayLarge: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                //h2
                displayMedium: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
                //h3
                displaySmall: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                //h4
                headlineMedium: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                //h5
                headlineSmall: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                //subtitle1
                titleMedium: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                //subtitle2
                titleSmall: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                //body1
                bodyLarge: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                labelLarge: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                labelMedium: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                //body2,
                bodyMedium: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 15,
                    fontWeight: FontWeight.normal))
            .apply(
          bodyColor: colorTextDefault,
          displayColor: colorTextDefault,
        ));
  }
}
