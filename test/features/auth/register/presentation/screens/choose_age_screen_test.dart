import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test choose age screen ui ", () {
    testWidgets(
      "test choose age screen ui elevated button tap and text widgets exist",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: ChooseAgeScreen(),
          ),
        );
        await tester.pumpAndSettle();
        final Finder elevatedButton = find.byType(ElevatedButton);
        expect(elevatedButton, findsOneWidget);
       await tester.tap(elevatedButton);
      },
    );
  });
}
