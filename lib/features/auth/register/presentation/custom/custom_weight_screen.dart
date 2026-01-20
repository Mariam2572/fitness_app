import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/custom_widgets/weight_selection_widget.dart';
import 'package:flutter/material.dart';

class CustomWeightScreen extends StatefulWidget {
  final int initialValue;
  final void Function(int)? onChanged;
  final void Function()? onPressed;
  final bool isEditProfile;
  const CustomWeightScreen({
    super.key,
    this.onPressed,
    this.initialValue = 20,
    this.onChanged,
    this.isEditProfile = true,
  });

  @override
  State<CustomWeightScreen> createState() => _CustomWeightScreenState();
}

class _CustomWeightScreenState extends State<CustomWeightScreen> {
  late int selectedWeight;
  @override
  void initState() {
    super.initState();
    selectedWeight = widget.initialValue;
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
              currentStep: 3,
              totalSteps: 6,
            ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            context.loc.whatIsYourWeight,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.baseWhite,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            context.loc.thisHelpsUsCreateYourPersonalizedPlan,
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.baseWhite,
            ),
          ),
        ),
        const SizedBox(height: 16),
        WeightSelectionWidget(
          initialValue: widget.initialValue,
          isEditProfile: widget.isEditProfile,
          onPressed: widget.onPressed,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
