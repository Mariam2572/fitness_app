import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_screen_body.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_sreen.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../view_model/cubit/register_cubit_test.mocks.dart';

@GenerateMocks([RegisterUseCase])
void main() {
  late final AppLocalizations appLocalizations;
  late final RegisterUseCase registerUseCase;
  setUpAll(() async {
    appLocalizations = await AppLocalizations.delegate.load(const Locale('en'));
    registerUseCase = MockRegisterUseCase();
  });

  Future<void> pumpWidgetWithLocalization(
    WidgetTester tester,
    Widget child,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: MediaQuery(
          data: const MediaQueryData(
            size: Size(1080, 1920),
            padding: EdgeInsets.only(top: 20, bottom: 20),
          ),
          child: BlocProvider<RegisterCubit>(
            create: (_) => RegisterCubit(registerUseCase),
            child: RegisterScreenBody(),
          ),
        ),
      ),
    );
  }

  group('register screen body', () {
    testWidgets('check if register background image is rendered', (
      tester,
    ) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      final authBackground = find.image(
        const AssetImage(AppAssets.authBackground),
      );
      expect(authBackground, findsOneWidget);
    });
    testWidgets('check if logo image is rendered', (tester) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      final logoFinder = find.image(const AssetImage(AppAssets.logo));
      expect(logoFinder, findsOneWidget);
    });
    testWidgets('check if text form field is rendered', (tester) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      final firstNameField = find.byType(TextFormField);
      expect(firstNameField, findsNWidgets(5));
    });
    testWidgets('check if register button is rendered', (tester) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      final registerButton = find.byType(ElevatedButton);
      expect(registerButton, findsOneWidget);
    });
  });
  group('text form field validation', () {
    testWidgets('check if text form field of email is validated', (
      tester,
    ) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      await tester.enterText(
        find.byKey(const ValueKey('emailField')),
        'mariam',
      );
      final button = find.byType(ElevatedButton);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();

      expect(find.text('email is not valid'), findsOneWidget);
    });
    testWidgets('check if text form field of email is validated', (
      tester,
    ) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      await tester.enterText(
        find.byKey(const ValueKey('emailField')),
        'mariam@gmail.com',
      );
      final button = find.byType(ElevatedButton);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();
      expect(find.text('email is not valid'), findsNothing);
    });
    testWidgets(
      'check if text form field of password is  validated when enter weak password',
      (tester) async {
        await pumpWidgetWithLocalization(tester, RegisterScreen());
        await tester.enterText(
          find.byKey(const ValueKey('passwordField')),
          'mariam',
        );
        final button = find.byType(ElevatedButton);
        await tester.ensureVisible(button);
        await tester.tap(button);
        await tester.pump();

        expect(
          find.text(
            'password must be at least 8 characters long, contain at least one uppercase letter and one number',
          ),
          findsOneWidget,
        );
      },
    );
    testWidgets('check if text form field of password is validated', (
      tester,
    ) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      await tester.enterText(find.byKey(const ValueKey('passwordField')), '');
      final button = find.byType(ElevatedButton);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();
      expect(find.text('password is required'), findsOneWidget);
    });
    testWidgets('check if text form field of confirm password is validated', (
      tester,
    ) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      await tester.enterText(
        find.byKey(const ValueKey('confirmPasswordField')),
        'mariammmm',
      );
      final button = find.byType(ElevatedButton);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();
      expect(find.text('passwords do not match'), findsOneWidget);
    });
    testWidgets('check if text form field of confirm password is validated', (
      tester,
    ) async {
      await pumpWidgetWithLocalization(tester, RegisterScreen());
      await tester.enterText(
        find.byKey(const ValueKey('confirmPasswordField')),
        '',
      );
      final button = find.byType(ElevatedButton);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();
      expect(find.text('confirm password is required'), findsOneWidget);
    });
  });
}
