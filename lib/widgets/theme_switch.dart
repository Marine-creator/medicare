import 'package:flutter/material.dart';

// Widget réutilisable permettant de changer
// entre le thème clair et le thème sombre
class ThemeSwitch extends StatelessWidget {
  // Indique si le thème sombre est actuellement activé
  final bool isDarkMode;

  // Fonction appelée lorsque l'utilisateur change le thème
  final ValueChanged<bool> onChanged;

  const ThemeSwitch({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      // Texte affiché à l'utilisateur
      title: const Text('Mode sombre'),

      // Petite icône qui change selon le thème
      secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),

      // État actuel du bouton
      value: isDarkMode,

      // Appelé lorsque l'utilisateur active/désactive
      // le mode sombre
      onChanged: onChanged,
    );
  }
}
