import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/number_picker_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WeightSelectionWidget extends StatefulWidget {
  final int initialValue;
  final bool isEditProfile;
  final void Function()? onPressed;
  final void Function(int)? onChanged;

  const WeightSelectionWidget({
    super.key,
    required this.initialValue,
    required this.isEditProfile,
    this.onPressed,
    this.onChanged,
  });

  @override
  State<WeightSelectionWidget> createState() => _WeightSelectionWidgetState();
}

class _WeightSelectionWidgetState extends State<WeightSelectionWidget> {
  late int selectedWeight;

  @override
  void initState() {
    super.initState();
    selectedWeight = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CustomGlassContainer(
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
            initialValue: selectedWeight,
            onChanged: (val) {
              setState(() {
                selectedWeight = val;
              });

              widget.onChanged?.call(val);
            },
          ),
          const SizedBox(height: 16),
          SvgPicture.asset(AppAssets.arrowUp),
          const SizedBox(height: 31),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed:
                  widget.isEditProfile
                      ? widget.onPressed
                      : () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.chooseHeightScreen,
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
    );
  }
}
