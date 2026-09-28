import 'package:flutter/material.dart';

import '../data/doctors_data.dart';
import '../models/doctor.dart';
import '../widgets/doctor_card.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  // Contrôleur permettant de récupérer le texte saisi
  // dans la barre de recherche.
  final TextEditingController _searchController = TextEditingController();

  // Texte actuellement recherché.
  String _searchText = '';

  // Spécialité sélectionnée pour le filtre.
  String _selectedSpecialty = 'Toutes';

  @override
  void dispose() {
    // Libère le contrôleur lorsque l'écran est détruit.
    _searchController.dispose();

    super.dispose();
  }

  // Retourne la liste des médecins après application
  // de la recherche et du filtre.
  List<Doctor> get filteredDoctors {
    return doctors.where((doctor) {
      // Vérifie si le nom ou la spécialité correspond
      // au texte recherché.
      final matchesSearch =
          doctor.name.toLowerCase().contains(_searchText.toLowerCase()) ||
          doctor.specialty.toLowerCase().contains(_searchText.toLowerCase());

      // Vérifie la spécialité sélectionnée.
      final matchesSpecialty =
          _selectedSpecialty == 'Toutes' ||
          doctor.specialty == _selectedSpecialty;

      // Le médecin doit respecter les deux conditions.
      return matchesSearch && matchesSpecialty;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Récupère toutes les spécialités disponibles
    // sans créer de données supplémentaires dans l'interface.
    final specialties = [
      'Toutes',
      ...doctors.map((doctor) => doctor.specialty).toSet(),
    ];

    return Scaffold(
      // Barre supérieure de l'écran.
      appBar: AppBar(title: const Text('Nos médecins')),

      body: Column(
        children: [
          // Zone contenant la recherche et le filtre.
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Barre de recherche.
                TextField(
                  controller: _searchController,

                  // À chaque modification du texte,
                  // on met à jour la liste.
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },

                  decoration: const InputDecoration(
                    labelText: 'Rechercher un médecin',
                    hintText: 'Nom ou spécialité',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                // Menu permettant de filtrer par spécialité.
                DropdownButtonFormField<String>(
                  // Valeur initiale du filtre.
                  initialValue: _selectedSpecialty,

                  decoration: const InputDecoration(
                    labelText: 'Filtrer par spécialité',
                    prefixIcon: Icon(Icons.filter_alt),
                    border: OutlineInputBorder(),
                  ),

                  // Liste des spécialités disponibles.
                  items: specialties.map((specialty) {
                    return DropdownMenuItem<String>(
                      value: specialty,
                      child: Text(specialty),
                    );
                  }).toList(),

                  // Quand l'utilisateur change de spécialité.
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      _selectedSpecialty = value;
                    });
                  },
                ),
              ],
            ),
          ),

          // Liste des médecins.
          Expanded(
            child: filteredDoctors.isEmpty
                ? const Center(
                    child: Text(
                      'Aucun médecin trouvé',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    // Nombre de médecins après filtrage.
                    itemCount: filteredDoctors.length,

                    // Construction de chaque médecin.
                    itemBuilder: (context, index) {
                      // Récupère le médecin correspondant
                      // à l'index de la liste filtrée.
                      final doctor = filteredDoctors[index];

                      // Utilise le widget réutilisable DoctorCard
                      // pour afficher les informations du médecin.
                      return DoctorCard(doctor: doctor);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
