import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  // Lance l'application MediCare
  runApp(const MediCareApp());
}

// Widget principal de l'application
class MediCareApp extends StatefulWidget {
  const MediCareApp({super.key});

  @override
  State<MediCareApp> createState() => _MediCareAppState();
}

class _MediCareAppState extends State<MediCareApp> {
  // Indique si le mode sombre est activé
  bool _isDarkMode = false;

  // Fonction permettant de changer le thème
  void _toggleTheme(bool value) {
    setState(() {
      // Met à jour l'état du thème
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Création du routeur
    final router = AppRouter.createRouter(
      // État actuel du thème
      isDarkMode: _isDarkMode,

      // Fonction permettant de changer le thème
      onThemeChanged: _toggleTheme,
    );

    return MaterialApp.router(
      // Nom de l'application
      title: 'MediCare',

      // Thème clair
      theme: AppTheme.lightTheme,

      // Thème sombre
      darkTheme: AppTheme.darkTheme,

      // Sélection du thème actuel
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Configuration de GoRouter
      routerConfig: router,
    );
  }
}
