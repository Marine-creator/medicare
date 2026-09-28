import 'package:flutter/material.dart';

import '../models/appointment.dart';

// Liste contenant les rendez-vous de l'application.
// Pour le moment, les données sont conservées en mémoire.
final List<Appointment> appointments = [
  Appointment(
    id: 'rdv001',

    // Identifiant du médecin
    doctorId: 'doc001',

    // Nom du patient
    patientName: 'Aminata Ouédraogo',

    // Numéro de téléphone
    phone: '70000000',

    // Motif du rendez-vous
    reason: 'Consultation médicale',

    // Date du rendez-vous
    date: DateTime(2026, 9, 15),

    // Heure du rendez-vous
    time: const TimeOfDay(hour: 10, minute: 30),
  ),
];
