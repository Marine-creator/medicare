import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/appointments_data.dart';
import '../data/doctors_data.dart';
import '../models/appointment.dart';

class AppointmentScreen extends StatefulWidget {
  // Identifiant du médecin sélectionné
  final String? doctorId;

  const AppointmentScreen({super.key, this.doctorId});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // Clé permettant de contrôler le formulaire
  final _formKey = GlobalKey<FormState>();

  // Contrôleur du nom
  final _nameController = TextEditingController();

  // Contrôleur du téléphone
  final _phoneController = TextEditingController();

  // Contrôleur du motif
  final _reasonController = TextEditingController();

  // Date sélectionnée
  DateTime? _selectedDate;

  // Heure sélectionnée
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    // Libère les contrôleurs
    _nameController.dispose();
    _phoneController.dispose();
    _reasonController.dispose();

    super.dispose();
  }

  // Permet de sélectionner une date
  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Permet de sélectionner une heure
  Future<void> _selectTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  // Valide et enregistre le rendez-vous
  void _submitForm() {
    // Vérifie les champs du formulaire
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Vérifie qu'une date a été sélectionnée
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez choisir une date de rendez-vous'),
        ),
      );
      return;
    }

    // Vérifie qu'une heure a été sélectionnée
    if (_selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez choisir une heure de rendez-vous'),
        ),
      );
      return;
    }

    // Vérifie qu'un médecin a été sélectionné
    if (widget.doctorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aucun médecin sélectionné')),
      );
      return;
    }

    // Création du nouveau rendez-vous
    final newAppointment = Appointment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      doctorId: widget.doctorId!,
      patientName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      reason: _reasonController.text.trim(),
      date: _selectedDate!,
      time: _selectedTime!,
    );

    // Ajoute le rendez-vous à la liste
    appointments.add(newAppointment);

    // Affiche un message de confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Rendez-vous enregistré avec succès !')),
    );

    // Retourne à la liste des rendez-vous
    context.go('/appointments');
  }

  @override
  Widget build(BuildContext context) {
    // Recherche le médecin sélectionné
    final doctor = widget.doctorId == null
        ? null
        : doctors.firstWhere((doctor) => doctor.id == widget.doctorId);

    return Scaffold(
      appBar: AppBar(title: const Text('Prendre rendez-vous')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Informations du médecin
            if (doctor != null) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Médecin sélectionné',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(doctor.specialty),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Champ nom
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom complet',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Veuillez entrer votre nom';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            // Champ téléphone
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Téléphone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Veuillez entrer votre téléphone';
                }

                if (value.trim().length < 8) {
                  return 'Le numéro doit contenir au moins 8 chiffres';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            // Champ motif
            TextFormField(
              controller: _reasonController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Motif du rendez-vous',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Veuillez indiquer le motif';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            // Bouton pour choisir la date
            OutlinedButton.icon(
              onPressed: _selectDate,
              icon: const Icon(Icons.calendar_month),
              label: Text(
                _selectedDate == null
                    ? 'Choisir une date'
                    : 'Date : ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              ),
            ),

            const SizedBox(height: 12),

            // Bouton pour choisir l'heure
            OutlinedButton.icon(
              onPressed: _selectTime,
              icon: const Icon(Icons.access_time),
              label: Text(
                _selectedTime == null
                    ? 'Choisir une heure'
                    : 'Heure : ${_selectedTime!.format(context)}',
              ),
            ),

            const SizedBox(height: 24),

            // Bouton de confirmation
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.check),
                label: const Text('Confirmer le rendez-vous'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
