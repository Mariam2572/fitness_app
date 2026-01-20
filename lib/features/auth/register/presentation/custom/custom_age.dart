import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/custom_widgets/age_selection_widget.dart';
import 'package:flutter/material.dart';

class CustomAge extends StatefulWidget {
  final int initialValue;
  final void Function(int)? onChanged;
  final bool isEditProfile;
  final void Function()? onPressed;
  const CustomAge({
    super.key,
    this.initialValue = 19,
    this.onChanged,
    this.isEditProfile = true,
    this.onPressed,
  });

  @override
  State<CustomAge> createState() => _CustomAgeState();
}

class _CustomAgeState extends State<CustomAge> {
  late int selectedAge;
  @override
  void initState() {
    super.initState();
    selectedAge = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 133),
        widget.isEditProfile
            ? const SizedBox()
            : const CircularPercentIndicatorWidget(
              currentStep: 2,
              totalSteps: 6,
            ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            context.loc.howOldAreYou,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.baseWhite,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            context.loc.thisHelpsUsCreateYourPersonalizedPlan,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.baseWhite),
          ),
        ),
        const SizedBox(height: 16),
        AgeSelectionWidget(
          initialValue: widget.initialValue,
          isEditProfile: widget.isEditProfile,
          onPressed: widget.onPressed,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
