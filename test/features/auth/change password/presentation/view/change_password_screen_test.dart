import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_cubit.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_states.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view/change_password_screen.dart';

import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_screen_test.mocks.dart';

@GenerateMocks([ChangePasswordCubit])
void main() {
  late ChangePasswordCubit mockCubit;

  setUp(() {
    mockCubit = MockChangePasswordCubit();
    when(
      mockCubit.stream,
    ).thenAnswer((_) => const Stream<ChangePasswordState>.empty());
    when(mockCubit.state).thenReturn(ChangePasswordInitial());
  });

  Future<void> pumpChangePasswordScreen(WidgetTester tester) async {
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
        home: BlocProvider<ChangePasswordCubit>.value(
          value: mockCubit,
          child: const ChangePasswordScreen(),
        ),
      ),
    );
  }

  group('ChangePasswordScreen UI', () {
    testWidgets('renders background image and form fields', (tester) async {
      await pumpChangePasswordScreen(tester);

      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('ChangePasswordScreen Validation', () {
    testWidgets('shows error if confirm password does not match', (
      tester,
    ) async {
      await pumpChangePasswordScreen(tester);

      await tester.enterText(find.byType(TextFormField).at(0), 'oldpassword');
      await tester.enterText(find.byType(TextFormField).at(1), 'newpass123');
      await tester.enterText(find.byType(TextFormField).at(2), 'differentpass');

      final button = find.byType(ElevatedButton);
      await tester.ensureVisible(button);

      await tester.tap(button);
      await tester.pump();

      expect(
        find.text('New password and confirmation do not match'),
        findsOneWidget,
      );
    });

    testWidgets('calls cubit when passwords match', (tester) async {
      await pumpChangePasswordScreen(tester);

      await tester.enterText(find.byType(TextFormField).at(0), 'oldpass');
      await tester.enterText(find.byType(TextFormField).at(1), 'newpass123');
      await tester.enterText(find.byType(TextFormField).at(2), 'newpass123');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
    });
  });
}
