import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  String name;
  String amount;

  IngredientItem({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppTextStyle.instance.textStyle16.copyWith(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                amount,
                style: AppTextStyle.instance.textStyle16.copyWith(
                  color: AppColors.mainRed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(color: AppColors.neutral70),
        ],
      ),
    );
  }
}
