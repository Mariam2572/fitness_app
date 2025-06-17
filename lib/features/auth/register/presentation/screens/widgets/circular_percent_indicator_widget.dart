import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentIndicatorWidget extends StatelessWidget {
  const CircularPercentIndicatorWidget({
    super.key,
    
    required this.currentStep, required this.totalSteps,
  });
 
  final int totalSteps;
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 25,
        lineWidth: 5,
        percent: currentStep / totalSteps,
        center: Text(
          '$currentStep/$totalSteps',
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
