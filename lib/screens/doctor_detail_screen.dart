import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/doctors_data.dart';

class DoctorDetailScreen extends StatelessWidget {
  // Identifiant du médecin reçu depuis GoRouter.
  final String doctorId;

  const DoctorDetailScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    // Cherche le médecin correspondant à l'identifiant reçu depuis GoRouter.
    final doctor = doctors.firstWhere((doctor) => doctor.id == doctorId);

    return Scaffold(
      // Barre supérieure de l'écran.
      appBar: AppBar(title: Text(doctor.name)),

      // Contenu de la page.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo ou icône du médecin.
              Center(
                child: CircleAvatar(
                  radius: 50,
                  child: const Icon(Icons.person, size: 50),
                ),
              ),

              const SizedBox(height: 20),

              // Nom du médecin.
              Text(
                doctor.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 8),

              // Spécialité du médecin.
              Text(
                doctor.specialty,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 16),

              // Description du médecin.
              Text(doctor.description),

              const SizedBox(height: 16),

              // Nombre d'années d'expérience.
              Text('${doctor.experience} ans d’expérience'),

              const SizedBox(height: 24),

              // Bouton permettant d'accéder au formulaire
              // de rendez-vous pour ce médecin.
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Transmet l'identifiant du médecin à la page
                    // de prise de rendez-vous.
                    context.go('/appointment?doctorId=${doctor.id}');
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Prendre rendez-vous'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
