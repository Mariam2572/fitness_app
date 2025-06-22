import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_height_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/number_picker_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChooseWeightScreenBody extends StatefulWidget {
  const ChooseWeightScreenBody({super.key});

  @override
  State<ChooseWeightScreenBody> createState() => _ChooseWeightScreenBodyState();
}

class _ChooseWeightScreenBodyState extends State<ChooseWeightScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 133),
        const CircularPercentIndicatorWidget(currentStep: 3, totalSteps: 6),
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
        CustomGlassContainer(
          height: context.height * 0.3,
          child: Column(
            children: [
              const SizedBox(height: 27),
              Text(
                context.loc.kg,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.mainRed,
                ),
              ),
              const SizedBox(height: 16),
              NumberPickerWidget(
                minValue: 40,
                maxValue: 200,
                initialValue: 40,
                onChanged: (val) {
                  context.read<RegisterCubit>().weight = val;
                  // print(
                  //   "---------weight is ${context.read<RegisterCubit>().weight}",
                  // );
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              SvgPicture.asset(AppAssets.arrowUp),
              const SizedBox(height: 31),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.chooseHeightScreen,
                      arguments: context.read<RegisterCubit>(),
                    );
                  },
                  child: Text(
                    context.loc.next,
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
