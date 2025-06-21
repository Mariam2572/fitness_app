import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  String imagePath;
  String label;
  RecommendationCard({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 163,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
      child: Stack(
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
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
