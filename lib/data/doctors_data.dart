import '../models/doctor.dart';

const List<Doctor> doctors = [
  Doctor(
    id: 'doc001',
    name: 'Dr. Jean Ouédraogo',
    specialty: 'Cardiologue',
    image: 'assets/images/doctor1.jpg',
    description: 'Médecin spécialisé dans les maladies cardiovasculaires.',
    experience: 10,
  ),
  Doctor(
    id: 'doc002',
    name: 'Dr. Awa Traoré',
    specialty: 'Pédiatre',
    image: 'assets/images/doctor2.jpg',
    description: 'Spécialiste de la santé et du suivi médical des enfants.',
    experience: 7,
  ),
  Doctor(
    id: 'doc003',
    name: 'Dr. Marie Kaboré',
    specialty: 'Dermatologue',
    image: 'assets/images/doctor3.jpg',
    description: 'Spécialiste des maladies et problèmes de la peau.',
    experience: 8,
  ),
  Doctor(
    id: 'doc004',
    name: 'Dr. Paul Sawadogo',
    specialty: 'Médecin généraliste',
    image: 'assets/images/doctor4.jpg',
    description: 'Prise en charge générale et orientation des patients.',
    experience: 5,
  ),
];
