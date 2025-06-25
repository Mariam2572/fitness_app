import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/choose_gender_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';

import 'package:flutter/material.dart';

class ChooseGenderScreenBody extends StatelessWidget {
  const ChooseGenderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 90),
        const CircularPercentIndicatorWidget(currentStep: 1, totalSteps: 6),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            context.loc.tellUsAboutYourSelf,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.baseWhite,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            context.loc.weNeedToKnowYourGender,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.baseWhite),
          ),
        ),
        const SizedBox(height: 16),
        const ChooseGenderContainer(),
      ],
    );
  }
}
