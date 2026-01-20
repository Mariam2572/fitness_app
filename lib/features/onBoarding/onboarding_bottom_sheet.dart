import 'dart:ui';

import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/onBoarding/dot.dart';
import 'package:fitness_app/features/onBoarding/onboarding_item.dart';
import 'package:fitness_app/features/onBoarding/onboarding_navigation.dart';
import 'package:flutter/material.dart';

class OnBoardingBottomSheet extends StatelessWidget {
  final OnBoardingItem item;
  final int currentIndex;
  final int total;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnBoardingBottomSheet({
    super.key,
    required this.item,
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.instance.textStyle24.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.instance.textStyle16.copyWith(
                    color: AppColors.neutral10,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    total,
                    (i) => Dot(isActive: i == currentIndex),
                  ),
                ),
                const SizedBox(height: 20),
                OnBoardingNavigation(
                  currentIndex: currentIndex,
                  total: total,
                  onNext: onNext,
                  onBack: onBack,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
