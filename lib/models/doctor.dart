class Doctor {
  // Identifiant unique du médecin.
  final String id;

  // Nom complet du médecin.
  final String name;

  // Spécialité médicale.
  final String specialty;

  // Chemin ou URL de l'image du médecin.
  final String image;

  // Description du médecin.
  final String description;

  // Nombre d'années d'expérience.
  final int experience;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.image,
    required this.description,
    required this.experience,
  });
}
