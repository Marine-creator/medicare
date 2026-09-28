# MediCare 🏥

MediCare est une application Flutter de gestion de rendez-vous médicaux.

L'application permet aux utilisateurs de consulter une liste de médecins, de rechercher et filtrer les médecins par spécialité, de consulter leurs informations détaillées et de prendre un rendez-vous médical.

## 📱 Fonctionnalités

MediCare propose les fonctionnalités suivantes :

* 🏠 Page d'accueil de l'application
* 👨‍⚕️ Liste des médecins disponibles
* 🔎 Recherche d'un médecin par nom ou spécialité
* 🏷️ Filtrage des médecins par spécialité
* 📋 Consultation des détails d'un médecin
* 📅 Prise de rendez-vous médical
* 📝 Validation du formulaire de rendez-vous
* 🕐 Sélection de la date et de l'heure du rendez-vous
* 📑 Consultation de la liste des rendez-vous
* 🌙 Activation du mode clair ou sombre
* 🧭 Navigation entre les différentes pages avec GoRouter

## 🛠️ Technologies utilisées

* **Flutter**
* **Dart**
* **Material Design**
* **GoRouter**

## 🗂️ Structure du projet

Le projet est organisé de manière à séparer les différentes responsabilités de l'application.

```text
lib/
├── main.dart
│
├── data/
│   ├── appointments_data.dart
│   └── doctors_data.dart
│
├── models/
│   ├── appointment.dart
│   └── doctor.dart
│
├── router/
│   └── app_router.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── doctors_screen.dart
│   ├── doctor_detail_screen.dart
│   ├── appointment_screen.dart
│   └── appointments_screen.dart
│
├── theme/
│   └── app_theme.dart
│
└── widgets/
    ├── doctor_card.dart
    ├── section_title.dart
    └── theme_switch.dart

test/
└── widget_test.dart
```

## 🧩 Organisation de l'application

### `models/`

Contient les modèles de données utilisés par l'application.

Par exemple :

* `Doctor` représente un médecin.
* `Appointment` représente un rendez-vous.

### `data/`

Contient les données utilisées par l'application, notamment la liste des médecins et les rendez-vous.

### `screens/`

Contient les différents écrans de l'application :

* **HomeScreen** : page d'accueil.
* **DoctorsScreen** : liste, recherche et filtrage des médecins.
* **DoctorDetailScreen** : détails d'un médecin.
* **AppointmentScreen** : formulaire de prise de rendez-vous.
* **AppointmentsScreen** : liste des rendez-vous enregistrés.

### `widgets/`

Contient des composants réutilisables :

* `DoctorCard`
* `SectionTitle`
* `ThemeSwitch`

L'utilisation de widgets réutilisables permet d'éviter de répéter le même code dans plusieurs écrans.

### `router/`

Contient la configuration de la navigation avec **GoRouter**.

Les principales routes sont :

```text
/                         → Accueil
/doctors                  → Liste des médecins
/doctors/:id              → Détails d'un médecin
/appointment              → Prise de rendez-vous
/appointments             → Liste des rendez-vous
```

### `theme/`

Contient la configuration des thèmes clair et sombre de l'application.

## 📋 Formulaire de rendez-vous

Le formulaire de rendez-vous permet à l'utilisateur de renseigner notamment :

* son nom ;
* son numéro de téléphone ;
* le motif du rendez-vous ;
* la date souhaitée ;
* l'heure souhaitée ;
* le médecin concerné.

Des validations sont appliquées afin de vérifier que les informations nécessaires sont renseignées avant l'enregistrement du rendez-vous.

## 🌙 Gestion du thème

MediCare propose deux modes d'affichage :

* ☀️ Mode clair
* 🌙 Mode sombre

Le changement de thème est géré au niveau de l'application et transmis aux écrans concernés.

## 🧪 Tests

Le projet contient des tests Flutter permettant notamment de vérifier l'affichage des principaux éléments de la page d'accueil.

Pour lancer les tests :

```bash
flutter test
```

Pour vérifier le code avec l'analyseur Flutter :

```bash
flutter analyze
```

## 🚀 Installation et lancement

### 1. Cloner le projet

```bash
git clone <URL_DU_REPOSITORY>
```

### 2. Accéder au projet

```bash
cd medicare
```

### 3. Installer les dépendances

```bash
flutter pub get
```

### 4. Vérifier le projet

```bash
flutter analyze
```

### 5. Lancer les tests

```bash
flutter test
```

### 6. Lancer l'application

```bash
flutter run
```

## 🎯 Objectif du projet

Ce projet a été réalisé dans le cadre d'un apprentissage du développement d'applications avec Flutter.

Il met en pratique plusieurs notions importantes :

* création d'interfaces avec Flutter ;
* gestion de l'état ;
* navigation avec GoRouter ;
* création de widgets réutilisables ;
* gestion des formulaires ;
* validation des données ;
* sélection de date et d'heure ;
* gestion des thèmes ;
* organisation d'un projet Flutter ;
* tests automatisés.

## 👩🏽‍💻 Auteur

**Marina Ouédraogo**

Projet Flutter — **MediCare**
