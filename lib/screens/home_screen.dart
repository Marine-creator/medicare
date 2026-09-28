import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/section_title.dart';
import '../widgets/theme_switch.dart';

class HomeScreen extends StatelessWidget {
  // Indique si le mode sombre est actuellement activé
  final bool isDarkMode;

  // Fonction appelée lorsqu'on change le thème
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MediCare')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icône principale de l'application
              const Icon(Icons.medical_services, size: 70),

              const SizedBox(height: 20),

              // Message d'accueil
              Text(
                'Bienvenue sur MediCare',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // Présentation de l'application
              Text(
                'Gérez facilement vos rendez-vous médicaux.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Widget réutilisable pour présenter
              // une section de l'application
              const SectionTitle(
                title: 'Votre espace santé',
                subtitle: 'Trouvez un médecin et gérez vos rendez-vous.',
              ),

              const SizedBox(height: 24),

              // Widget réutilisable permettant
              // de changer le thème de l'application
              ThemeSwitch(isDarkMode: isDarkMode, onChanged: onThemeChanged),

              const SizedBox(height: 20),

              // Bouton permettant d'accéder à la liste
              // des médecins
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.go('/doctors');
                  },
                  icon: const Icon(Icons.people),
                  label: const Text('Voir les médecins'),
                ),
              ),

              const SizedBox(height: 12),

              // Bouton permettant d'accéder
              // aux rendez-vous
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.go('/appointments');
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Mes rendez-vous'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
