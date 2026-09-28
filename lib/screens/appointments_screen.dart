import 'package:flutter/material.dart';

import '../data/appointments_data.dart';
import '../data/doctors_data.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes rendez-vous')),

      // Vérifie s'il existe des rendez-vous
      body: appointments.isEmpty
          ? const Center(
              child: Text('Aucun rendez-vous', style: TextStyle(fontSize: 18)),
            )
          // Affiche la liste des rendez-vous
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                // Récupère le rendez-vous actuel
                final appointment = appointments[index];

                // Recherche le médecin correspondant
                final doctor = doctors.firstWhere(
                  (doctor) => doctor.id == appointment.doctorId,
                );

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nom du médecin
                        Text(
                          doctor.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        // Spécialité du médecin
                        Text(doctor.specialty),

                        const Divider(height: 24),

                        // Nom du patient
                        Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 8),
                            Text(appointment.patientName),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Téléphone du patient
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            const SizedBox(width: 8),
                            Text(appointment.phone),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Date du rendez-vous
                        Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: 8),
                            Text(
                              '${appointment.date.day}/${appointment.date.month}/${appointment.date.year}',
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Heure du rendez-vous
                        Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(width: 8),
                            Text(appointment.time.format(context)),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Motif du rendez-vous
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.description),
                            const SizedBox(width: 8),
                            Expanded(child: Text(appointment.reason)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
