import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/doctor.dart';

class DoctorCard extends StatelessWidget {
  // Médecin à afficher dans la carte
  final Doctor doctor;

  const DoctorCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ListTile(
        // Icône représentant le médecin
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),

        // Nom du médecin
        title: Text(doctor.name),

        // Spécialité du médecin
        subtitle: Text(doctor.specialty),

        // Indique que la carte est cliquable
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),

        // Ouvre la page de détail du médecin
        onTap: () {
          context.go('/doctors/${doctor.id}');
        },
      ),
    );
  }
}