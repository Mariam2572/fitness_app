import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentIndicatorWidget extends StatelessWidget {
  const CircularPercentIndicatorWidget({super.key, required this.percent, required this.achive});
  final double percent;
  final String achive;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 25,
        lineWidth: 5,
        percent: percent,
        center: Text(
          achive,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        progressColor: AppColors.mainRed,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
