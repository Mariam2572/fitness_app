import 'package:fitness_app/features/auth/register/presentation/screens/choose_gender_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test choose gender screen ui ", () {
    testWidgets(
      'test choose gender screen ui if CircularPercentIndicatorWidget and text widgets are exist',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: ChooseGenderScreen(),
          ),
        );
        await tester.pumpAndSettle();

        final Finder findCircularPercentIndicatorWidget = find.byType(
          CircularPercentIndicatorWidget,
        );
        final Finder findTextWidget = find.byType(Text);
        expect(findCircularPercentIndicatorWidget, findsOneWidget);
        expect(findTextWidget, findsNWidgets(6));
      },
    );
    testWidgets('test choose gender screen ui elevated button tap', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ChooseGenderScreen(),
        ),
      );
      await tester.pumpAndSettle();

      final Finder elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
     await tester.tap(elevatedButton);
      
    });
  });
}
