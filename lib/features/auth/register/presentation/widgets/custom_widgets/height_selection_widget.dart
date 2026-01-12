import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/number_picker_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeightSelectionWidget extends StatefulWidget {
  final int initialValue;
  final bool isEditProfile;
  final void Function()? onPressed;
  final void Function(int)? onChanged;

  const HeightSelectionWidget({
    super.key,
    required this.initialValue,
    required this.isEditProfile,
    this.onPressed,
    this.onChanged,
  });

  @override
  State<HeightSelectionWidget> createState() => _HeightSelectionWidgetState();
}

class _HeightSelectionWidgetState extends State<HeightSelectionWidget> {
  late int selectedHeight;

  @override
  void initState() {
    super.initState();
    selectedHeight = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CustomGlassContainer(
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
                          RoutesName.goals,
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
