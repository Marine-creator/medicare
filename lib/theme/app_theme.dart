import 'package:flutter/material.dart';

class AppTheme {
  // ==============================
  // THÈME CLAIR
  // ==============================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    // Couleur principale de l'application
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),

    // Apparence de la barre supérieure
    appBarTheme: const AppBarTheme(centerTitle: true),

    // Apparence des champs de formulaire
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );

  // ==============================
  // THÈME SOMBRE
  // ==============================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    // Couleur principale du thème sombre
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),

    // Apparence de la barre supérieure
    appBarTheme: const AppBarTheme(centerTitle: true),

    // Apparence des champs de formulaire
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
