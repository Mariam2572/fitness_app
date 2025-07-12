// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart';

class CustomGoalsScreen extends StatefulWidget {
  final void Function(String?) onChanged;
  final bool isEditProfile;
  final String? initialGoal;
  // final void Function()? onPressed;
  const CustomGoalsScreen({
    super.key,
    // required this.onPressed,
    required this.onChanged,
    required this.isEditProfile,
    this.initialGoal,
  });

  @override
  State<CustomGoalsScreen> createState() => _CustomGoalsScreenState();
}

class _CustomGoalsScreenState extends State<CustomGoalsScreen> {
  late String? selectedGoal;

  @override
  void initState() {
    super.initState();
    selectedGoal = widget.initialGoal;
  }

  void _onGoalSelected(String value) {
    setState(() => selectedGoal = value);
    widget.onChanged.call(value);
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.goalBackground, fit: BoxFit.cover),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7), // adjust as needed
            child: Container(
              color: Colors.black.withOpacity(0), // Transparent layer
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),

                        Image.asset(AppAssets.fit, width: 80),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    const CircularPercentIndicatorWidget(
                      currentStep: 5,
                      totalSteps: 6,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      'context.loc.whatsYourGoal',
                      style: AppTextStyle.instance.textStyle20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      context.loc.thisHelpsUsCreateYourPersonalizedPlan,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.instance.textStyle16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.46,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.neutral80.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...goals.map(
                                  (goal) => Column(
                                    children: [
                                      OptionItem(
                                        value: goal,
                                        label: goal,
                                        selectedValue: selectedGoal,
                                        onChanged:
                                            (value) => _onGoalSelected(value!),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                                // if (!widget.isEditProfile)
                                //  const SizedBox(),
                                ElevatedButton(
                                  onPressed: () {
                                    if (selectedGoal == null) {
                                      showSnackBar(
                                        context,
                                        'Please Select Your Goal',
                                      );
                                      return;
                                    }
                                    if (widget.isEditProfile) {
                                      context.read<EditProfileCubit>().goal =
                                          selectedGoal!;
                                      Navigator.pop(context);
                                    }

                                    context.read<RegisterCubit?>()?.goal =
                                        selectedGoal;
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
                                    style: AppTextStyle.instance.textStyle14
                                        .copyWith(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
