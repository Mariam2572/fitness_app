import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/ingredient_item.dart';
import 'package:flutter/material.dart';

class IngredientColumn extends StatelessWidget {
  final MealDetails meal;

  const IngredientColumn({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mealMap = meal.toJson();

    final List<Widget> ingredientWidgets = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = mealMap['strIngredient$i']?.toString().trim();
      final amount = mealMap['strMeasure$i']?.toString().trim();

      if (ingredient != null &&
          ingredient.isNotEmpty &&
          ingredient != 'null' &&
          amount != null &&
          amount.isNotEmpty &&
          amount != 'null') {
        ingredientWidgets.add(IngredientItem(name: ingredient, amount: amount));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredientWidgets,
    );
  }
}
