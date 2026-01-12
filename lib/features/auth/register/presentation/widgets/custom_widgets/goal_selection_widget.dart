import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalSelectionWidget extends StatefulWidget {
  final bool isEditProfile;
  final String? initialGoal;
  final void Function(String) onGoalSelected;
  final void Function()? onPressed;

  const GoalSelectionWidget({
    super.key,
    required this.isEditProfile,
    this.initialGoal,
    required this.onGoalSelected,
    this.onPressed,
  });

  @override
  State<GoalSelectionWidget> createState() => _GoalSelectionWidgetState();
}

class _GoalSelectionWidgetState extends State<GoalSelectionWidget> {
  late String? selectedGoal;

  @override
  void initState() {
    super.initState();
    selectedGoal = widget.initialGoal;
  }

  void _onGoalSelected(String value) {
    setState(() => selectedGoal = value);
    widget.onGoalSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> goals = [
      context.loc.gainWeight,
      context.loc.loseWeight,
      context.loc.getFitter,
      context.loc.gainMoreFlexibility,
      context.loc.learnTheBasics,
    ];

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.46,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.neutral80.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SingleChildScrollView(
            child: RadioGroup<String>(
              groupValue: selectedGoal,
              onChanged: (value) {
                if (value != null) _onGoalSelected(value);
              },
              child: Column(
                children: [
                  ...goals.map(
                    (goal) => Column(
                      children: [
                        OptionItem(value: goal, label: goal),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedGoal == null) {
                        showSnackBar(context, 'Please Select Your Goal');
                        return;
                      }
                      if (widget.isEditProfile) {
                        widget.onPressed?.call();
                        return;
                      }
                      context.read<RegisterCubit?>()?.goal = selectedGoal;
                      Navigator.pushNamed(
                        context,
                        RoutesName.activities,
                        arguments: context.read<RegisterCubit>(),
                      );
                    },
                    child: Text(
                      widget.isEditProfile
                          ? context.loc.done
                          : context.loc.next,
                      style: AppTextStyle.instance.textStyle14.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
