import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/number_picker_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChooseAgeScreenBody extends StatefulWidget {
  const ChooseAgeScreenBody({super.key});

  @override
  State<ChooseAgeScreenBody> createState() => _ChooseAgeScreenBodyState();
}

class _ChooseAgeScreenBodyState extends State<ChooseAgeScreenBody> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 133),
        const CircularPercentIndicatorWidget(percent: 0.1, achive: '2/6'),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            localization.howOldAreYou,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            localization.thisHelpsUsCreateYourPersonalizedPlan,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.white),
          ),
        ),
        const SizedBox(height: 16),
        CustomGlassContainer(
          height: context.height * 0.3,
          child: Column(
            children: [
              const SizedBox(height: 27),
              Text(
                context.loc.year,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.mainRed,
                ),
              ),
              const SizedBox(height: 16),
              NumberPickerWidget(
                minValue: 15,
                maxValue: 90,
                initialValue: 15,
                onChanged: (val) {
                  context.read<RegisterCubit>().age = val;
                  print("aaaaaaage is ${context.read<RegisterCubit>().age}");
                  setState(() {

                  });
                },
              ),
              const SizedBox(height: 16),
              SvgPicture.asset(AppAssets.arrowUp),
              const SizedBox(height: 31),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    localization.next,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.white,
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
