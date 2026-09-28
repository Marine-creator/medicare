import 'package:flutter/material.dart';

class Appointment {
  // Identifiant du rendez-vous
  final String id;

  // Identifiant du médecin
  final String doctorId;

  // Nom du patient
  final String patientName;

  // Numéro de téléphone du patient
  final String phone;

  // Motif du rendez-vous
  final String reason;

  // Date du rendez-vous
  final DateTime date;

  // Heure du rendez-vous
  final TimeOfDay time;

  const Appointment({
    required this.id,
    required this.doctorId,
    required this.patientName,
    required this.phone,
    required this.reason,
    required this.date,
    required this.time,
  });
}
