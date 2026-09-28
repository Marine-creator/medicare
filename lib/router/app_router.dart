import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/doctors_screen.dart';
import '../screens/doctor_detail_screen.dart';
import '../screens/appointment_screen.dart';
import '../screens/appointments_screen.dart';

class AppRouter {
  // Crée la configuration de navigation
  // de toute l'application
  static GoRouter createRouter({
    // Indique si le mode sombre est activé
    required bool isDarkMode,

    // Fonction permettant de changer le thème
    required ValueChanged<bool> onThemeChanged,
  }) {
    return GoRouter(
      // Page affichée au démarrage
      initialLocation: '/',

      routes: [
        // ==============================
        // ÉCRAN D'ACCUEIL
        // ==============================
        GoRoute(
          path: '/',
          builder: (context, state) {
            return HomeScreen(
              // Envoie l'état actuel du thème
              isDarkMode: isDarkMode,

              // Envoie la fonction qui permet
              // de modifier le thème
              onThemeChanged: onThemeChanged,
            );
          },
        ),

        // ==============================
        // LISTE DES MÉDECINS
        // ==============================
        GoRoute(
          path: '/doctors',
          builder: (context, state) {
            return const DoctorsScreen();
          },
        ),

        // ==============================
        // DÉTAIL D'UN MÉDECIN
        // ==============================
        GoRoute(
          path: '/doctors/:id',
          builder: (context, state) {
            // Récupère l'identifiant du médecin
            // depuis l'URL
            final doctorId = state.pathParameters['id']!;

            // Envoie l'identifiant à l'écran
            // de détail
            return DoctorDetailScreen(doctorId: doctorId);
          },
        ),

        // ==============================
        // FORMULAIRE DE RENDEZ-VOUS
        // ==============================
        GoRoute(
          path: '/appointment',
          builder: (context, state) {
            // Récupère l'identifiant du médecin
            // depuis le paramètre de l'URL
            final doctorId = state.uri.queryParameters['doctorId'];

            return AppointmentScreen(doctorId: doctorId);
          },
        ),

        // ==============================
        // LISTE DES RENDEZ-VOUS
        // ==============================
        GoRoute(
          path: '/appointments',
          builder: (context, state) {
            return const AppointmentsScreen();
          },
        ),
      ],
    );
  }
}
