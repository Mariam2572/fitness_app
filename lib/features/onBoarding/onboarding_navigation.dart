import 'dart:ui';

import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingNavigation extends StatelessWidget {
  final int currentIndex;
  final int total;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnBoardingNavigation({
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {
      return ElevatedButton(
        onPressed: onNext,
        child: Text(
          'Next',
          style: AppTextStyle.instance.textStyle14.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onBack,
            child: Text(
              'Back',
              style: AppTextStyle.instance.textStyle14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Spacer(),
        Expanded(
          child: ElevatedButton(
            onPressed: onNext,
            child: Text(
              currentIndex == total - 1 ? 'Got It' : 'Next',
              style: AppTextStyle.instance.textStyle14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
