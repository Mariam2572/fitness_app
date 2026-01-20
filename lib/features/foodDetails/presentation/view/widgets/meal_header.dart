import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/video_player_widget.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/nutrient_box_widget.dart';
import 'package:flutter/material.dart';

class MealHeader extends StatelessWidget {
  final MealDetails? meal;

  const MealHeader({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 340,
            child: Image.network(meal?.strMealThumb ?? '', fit: BoxFit.cover),
          ),
        ),

        Positioned(
          top: 16,
          right: 16,

          child: VideoPlayerWidgetWithLink(link: meal?.strYoutube ?? ''),
        ),

        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/images/Back.png", scale: 4),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal?.strMeal ?? 'Unknown Meal',
                style: AppTextStyle.instance.textStyle24.copyWith(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                meal?.strInstructions ?? 'Could not load meal description.',
                style: AppTextStyle.instance.textStyle16.copyWith(
                  color: AppColors.baseWhite,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NutrientBoxWidget(value: '100 K', label: 'Energy'),
                  NutrientBoxWidget(value: '15 G', label: 'Protein'),
                  NutrientBoxWidget(value: '58 G', label: 'Carbs'),
                  NutrientBoxWidget(value: '20 G', label: 'Fat'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
