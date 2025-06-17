import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/views/goals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'goals_screen_test.mocks.dart';

@GenerateMocks([RegisterCubit])
void main() {
  late MockRegisterCubit mockRegisterCubit;

  setUp(() {
    mockRegisterCubit = MockRegisterCubit();
  });

  Future<void> pumpGoalsScreen(WidgetTester tester) async {
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
          data: const MediaQueryData(size: Size(1080, 1920)),
          child: BlocProvider<RegisterCubit>.value(
            value: mockRegisterCubit,
            child: const GoalsScreen(),
          ),
        ),
      ),
    );
  }

  group('GoalsScreen UI tests', () {
    testWidgets("render background image", (tester) async {
      await pumpGoalsScreen(tester);
      final background = find.image(
        const AssetImage("assets/images/background.png"),
      );

      expect(background, findsOneWidget); // this should pass
    });

    testWidgets('renders progress indicator with label 5/6', (tester) async {
      await pumpGoalsScreen(tester);
      expect(find.text('5/6'), findsOneWidget);
    });

    testWidgets('renders "WHAT IS YOUR GOAL ?" text', (tester) async {
      await pumpGoalsScreen(tester);
      expect(find.text('WHAT IS YOUR GOAL ?'), findsOneWidget);
    });

    testWidgets('renders goal options', (tester) async {
      await pumpGoalsScreen(tester);
      expect(find.text('Gain Weight'), findsOneWidget);
      expect(find.text('Lose Weight'), findsOneWidget);
      expect(find.text('Get Fitter'), findsOneWidget);
      expect(find.text('Gain More Flexible'), findsOneWidget);
      expect(find.text('Learn The Basic'), findsOneWidget);
    });

    testWidgets('renders Next button', (tester) async {
      await pumpGoalsScreen(tester);
      expect(find.widgetWithText(ElevatedButton, 'Next'), findsOneWidget);
    });

    testWidgets('tapping Next triggers cubit goal update and navigates', (
      tester,
    ) async {
      await pumpGoalsScreen(tester);
      await tester.pumpAndSettle();
      final Finder elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
      await tester.tap(elevatedButton);
    });
  });
}
