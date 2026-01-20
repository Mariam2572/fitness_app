import 'package:fitness_app/features/home/home/presentation/views/home_screen.dart';
import 'package:fitness_app/features/layOut/lay_out.dart';
import 'package:fitness_app/features/profile/presentation/view/profile_view.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/smart_coach_view.dart';
import 'package:fitness_app/features/workOuts/presentation/views/work_outs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LayOut navigation works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LayOut()));

    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.text("Smart Chat"));
    await tester.pumpAndSettle();
    expect(find.byType(SmartCoachView), findsOneWidget);

    await tester.tap(find.text("Work Outs"));
    await tester.pumpAndSettle();
    expect(find.byType(WorkOutsView), findsOneWidget);

    await tester.tap(find.text("Profile"));
    await tester.pumpAndSettle();
    expect(find.byType(ProfileView), findsOneWidget);
  });
}
