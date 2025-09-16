import 'package:fitness_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test login screen", () {
    late AppLocalizations appLocalizations;
    setUpAll(() async {
      appLocalizations = await AppLocalizations.delegate.load(Locale("en"));
    });
    testWidgets(
      'LoginScreen renders with background image and transparent scaffold',
      (tester) async {
        //arrange
        await tester.pumpWidget(MaterialApp(home: LoginScreen()));

        //act
        final stackFinder = find.byType(Stack);
        final imageFinder = find.byType(Image);
        final scaffoldFinder = find.byType(Scaffold);
        final appBarFinder = find.byType(AppBar);
        //assert
        expect(stackFinder, findsOneWidget);
        expect(imageFinder, findsAtLeastNWidgets(2));
        expect(scaffoldFinder, findsOneWidget);
        expect(appBarFinder, findsOneWidget);
      },
    );
  });
}
