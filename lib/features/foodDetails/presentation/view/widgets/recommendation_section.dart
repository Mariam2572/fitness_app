import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/recommendation_card.dart';
import 'package:flutter/material.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection();

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
        Row(
          children: [
            Expanded(
              child: RecommendationCard(
                imagePath: 'assets/images/test image.png',
                label: "Pasta with chicks",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RecommendationCard(
                imagePath: 'assets/images/pasta image.png',
                label: "",
              ),
            ),
          ],
        ),
      ],
    );
  }
}