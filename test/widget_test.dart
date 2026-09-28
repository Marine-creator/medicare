import 'package:flutter_test/flutter_test.dart';

import 'package:medicare/main.dart';

void main() {
  testWidgets('MediCare affiche la page d accueil', (
    WidgetTester tester,
  ) async {
    // Lance l'application MediCare.
    await tester.pumpWidget(const MediCareApp());

    // Vérifie que le titre principal de l'application
    // est bien affiché.
    expect(find.text('MediCare'), findsOneWidget);

    // Vérifie que le message d'accueil est présent.
    expect(find.text('Bienvenue sur MediCare'), findsOneWidget);

    // Vérifie que le bouton permettant de voir
    // les médecins est présent.
    expect(find.text('Voir les médecins'), findsOneWidget);

    // Vérifie que le bouton permettant d'accéder
    // aux rendez-vous est présent.
    expect(find.text('Mes rendez-vous'), findsOneWidget);
  });
}
