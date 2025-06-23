// import 'package:fitness_app/features/layOut/lay_out.dart';
// import 'package:fitness_app/features/profile/profile_view.dart';
// import 'package:fitness_app/features/smartCoach/smart_coach_view.dart';
// import 'package:fitness_app/features/workOuts/work_outs_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
//
// void main() {
//   testWidgets('BottomNavigationBar switches between tabs', (
//     WidgetTester tester,
//   ) async {
//     await tester.pumpWidget(const MaterialApp(home: LayOut()));
//
//     expect(find.byType(HomeView), findsOneWidget);
//
//     await tester.tap(find.text('Smart Chat'));
//     await tester.pumpAndSettle();
//     expect(find.byType(SmartCoachView), findsOneWidget);
//
//     await tester.tap(find.text('Work Outs'));
//     await tester.pumpAndSettle();
//     expect(find.byType(WorkOutsView), findsOneWidget);
//
//     await tester.tap(find.text('Profile'));
//     await tester.pumpAndSettle();
//     expect(find.byType(ProfileView), findsOneWidget);
//   });
// }
