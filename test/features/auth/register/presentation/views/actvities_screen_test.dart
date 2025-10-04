import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';

import 'package:fitness_app/features/auth/register/presentation/screens/actvities_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'goals_screen_test.mocks.dart';

@GenerateMocks([RegisterCubit])
void main() {
  late MockRegisterCubit mockRegisterCubit;

  setUp(() {
    mockRegisterCubit = MockRegisterCubit();
  });

  Future<void> pumpActivtiesScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            size: Size(1080, 1920),
            // padding: EdgeInsets.only(top: 20, bottom: 20),
          ),
          child: BlocProvider<RegisterCubit>.value(
            value: mockRegisterCubit,
            child: const ActivtiesScreen(),
          ),
        ),
      ),
    );
  }

  group('ActivitiesScreen UI tests', () {
    testWidgets("renders background image", (tester) async {
      await pumpActivtiesScreen(tester);
      final bgImage = find.image(
        const AssetImage("assets/images/background.png"),
      );
      expect(bgImage, findsOneWidget);
    });

    testWidgets('renders progress indicator with label 6/6', (tester) async {
      await pumpActivtiesScreen(tester);
      expect(find.text('6/6'), findsOneWidget);
    });

    testWidgets('renders title parts correctly', (tester) async {
      await pumpActivtiesScreen(tester);
      expect(find.text('YOUR REGULAR PHYSUCAL'), findsOneWidget);
      expect(find.text('ACTIVITY LEVEL?'), findsOneWidget);
    });

    testWidgets('renders all activity options', (tester) async {
      await pumpActivtiesScreen(tester);
      expect(find.text('Rookie'), findsOneWidget);
      expect(find.text('Beginner'), findsOneWidget);
      expect(find.text('Intermediate'), findsOneWidget);
      expect(find.text('Advance'), findsOneWidget);
      expect(find.text('True Beast'), findsOneWidget);
    });

    testWidgets('renders Next button', (tester) async {
      await pumpActivtiesScreen(tester);
      expect(find.widgetWithText(ElevatedButton, 'Next'), findsOneWidget);
    });

    testWidgets('tapping Next calls RegisterCubit.doIntent', (tester) async {
      await pumpActivtiesScreen(tester);

      await pumpActivtiesScreen(tester);
      await tester.pumpAndSettle();
      final Finder elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
      await tester.tap(elevatedButton);
    });
  });
}
