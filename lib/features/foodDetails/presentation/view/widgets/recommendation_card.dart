// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
final  String imagePath;
final String label;
final List<Meal> meals;
final Meal meal;
  const RecommendationCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.meals,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.mealsDetailsScreen,
          arguments: {'id': meal.id, 'meals': meals},
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: 160,
        width: 163,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, right: 20),
              child: Text(
                label,
                style: AppTextStyle.instance.textStyle16.copyWith(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
