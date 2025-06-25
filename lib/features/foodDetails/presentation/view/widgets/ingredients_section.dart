import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/ingrediant_column.dart';
import 'package:flutter/material.dart';

class IngredientsSection extends StatelessWidget {
  final MealDetails? meal;

  const IngredientsSection({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: AppTextStyle.instance.textStyle20.copyWith(
            color: AppColors.baseWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2D2D2D),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          child: meal != null
              ? IngredientColumn(meal: meal?? MealDetails())
              : const Text(
            'No ingredients available.',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}