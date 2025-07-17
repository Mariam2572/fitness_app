import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/number_picker_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      widget.isEditProfile ? const SizedBox() :    const CircularPercentIndicatorWidget(currentStep: 4, totalSteps: 6),
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
        CustomGlassContainer(
          height: context.height * 0.3,
          child: Column(
            children: [
              const SizedBox(height: 27),
              Text(
                context.loc.cm,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.mainRed,
                ),
              ),
              const SizedBox(height: 16),
              NumberPickerWidget(
                minValue: 100,
                maxValue: 200,
                initialValue: selectedHeight,
                onChanged: (val) {
                  setState(() {
                    selectedHeight = val;
                  });
                  widget.onChanged?.call(val);
                },
              ),
              const SizedBox(height: 16),
              SvgPicture.asset(AppAssets.arrowUp),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed:
                      widget.isEditProfile
                          ? widget.onPressed
                          : () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.chooseWeightScreen,
                              arguments: context.read<RegisterCubit>(),
                            );
                          },
                  child: Text(
                    widget.isEditProfile ? context.loc.done : context.loc.next,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
