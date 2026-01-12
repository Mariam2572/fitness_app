import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/custom_widgets/height_selection_widget.dart';
import 'package:flutter/material.dart';

class CustomHeightScreen extends StatefulWidget {
  final bool isEditProfile;
  final int initialValue;
  final void Function()? onPressed;
  final void Function(int)? onChanged;

  const CustomHeightScreen({
    this.onPressed,
    super.key,
    this.isEditProfile = false,
    this.initialValue = 30,
    this.onChanged,
  });

  @override
  State<CustomHeightScreen> createState() => _CustomHeightScreenState();
}

class _CustomHeightScreenState extends State<CustomHeightScreen> {
  late int selectedHeight;

  @override
  void initState() {
    super.initState();
    selectedHeight = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
          const SizedBox(height: 133),
          widget.isEditProfile
              ? const SizedBox()
              : const CircularPercentIndicatorWidget(
                currentStep: 4,
                totalSteps: 6,
              ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              context.loc.whatIsYourHeight,
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
        ],
        HeightSelectionWidget(
          initialValue: widget.initialValue,
          isEditProfile: widget.isEditProfile,
          onPressed: widget.onPressed,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
