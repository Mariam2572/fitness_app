import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MealRecommendationTitle extends StatelessWidget {
  const MealRecommendationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            loc.recommendationsForYou,
            style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.food);
          },
          child: Text(
            loc.seeAll,
            style: text.bodyLarge?.copyWith(color: AppColors.mainRed),
          ),
        ),
      ],
    );
  }
}
