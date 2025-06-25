import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/recommendation_card.dart';
import 'package:flutter/material.dart';


class RecommendationsSection extends StatelessWidget {
  final List<Meal> meals;
  const RecommendationsSection({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: AppTextStyle.instance.textStyle20.copyWith(
            color: AppColors.baseWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return RecommendationCard(
                imagePath: meal.thumbnail ?? '',
                label: meal.name ?? '',
              );
            },
          ),
        )

      ],
    );
  }
}