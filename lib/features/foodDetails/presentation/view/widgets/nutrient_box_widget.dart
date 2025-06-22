import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class NutrientBoxWidget extends StatelessWidget {
  String value;
  String label;

  NutrientBoxWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 44,
      // width: 44,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.baseWhite),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          right: 11.5,
          left: 11.5,
        ),
        child: Column(
          children: [
            Text(
              value,
              style: AppTextStyle.instance.textStyle12.copyWith(
                color: AppColors.baseWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyle.instance.textStyle12.copyWith(
                color: AppColors.mainRed,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
