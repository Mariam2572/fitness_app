import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/food_recommendation_view_body.dart.dart';

void main() {
  Future<void> pumpFoodWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: FoodRecommendationViewBody())),
    );
  }

  group('Food Page UI Tests', () {
    testWidgets('Should render title', (tester) async {
      await pumpFoodWidget(tester);
      expect(find.text('Food Recommendation'), findsOneWidget);
    });

    testWidgets('Should render back button and it is clickable', (
      tester,
    ) async {
      await pumpFoodWidget(tester);
      final backIcon = find.byIcon(Icons.keyboard_arrow_left);
      expect(backIcon, findsOneWidget);
      await tester.tap(backIcon);
      await tester.pumpAndSettle();
    });

    testWidgets('Should render GridView', (tester) async {
      await pumpFoodWidget(tester);
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
