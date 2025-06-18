import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart'
    show GoalOptionItem;
import 'package:fitness_app/features/auth/register/presentation/widgets/register_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivtiesScreen extends StatefulWidget {
  const ActivtiesScreen({super.key});

  @override
  State<ActivtiesScreen> createState() => _ActivtiesScreenState();
}

class _ActivtiesScreenState extends State<ActivtiesScreen> {
  String? selectedActivity = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurredBackground(imagePath: "assets/images/background.png"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),

                        Image.asset("assets/images/fit 1.png", width: 80),
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                    ProgressCircleIndicator(
                      label: '6/6',
                      value: 6 / 6,
                      angle: 4.2,
                      progressColor: AppColors.mainRed,
                      textStyle: AppTextStyle.instance.textStyle16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      'YOUR REGULAR PHYSUCAL',
                      style: AppTextStyle.instance.textStyle20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'ACTIVITY LEVEL?',
                      style: AppTextStyle.instance.textStyle20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
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
                                GoalOptionItem(
                                  label: 'Rookie',
                                  selectedValue: selectedActivity,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedActivity = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                GoalOptionItem(
                                  label: 'Beginner',
                                  selectedValue: selectedActivity,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedActivity = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                GoalOptionItem(
                                  label: 'intermediate',
                                  selectedValue: selectedActivity,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedActivity = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                GoalOptionItem(
                                  label: 'Advance',
                                  selectedValue: selectedActivity,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedActivity = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                GoalOptionItem(
                                  label: 'True Beast',
                                  selectedValue: selectedActivity,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedActivity = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                BlocListener<RegisterCubit, RegisterState>(
                                  listener: (context, state) {
                                    if (state is RegisterSuccess) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Registration Successful!',
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    }
                                    if (state is RegisterFailure) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(state.error),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                  child: ElevatedButton(
                                    onPressed: () {
                                        context.read<RegisterCubit>().activityLevel =
                                        selectedActivity;
                                      final cubit =
                                          context.read<RegisterCubit>();
                                      final request = RegisterRequest(
                                        firstName:
                                        cubit.firstNameController.text,
                                        lastName: cubit.lastNameController.text,
                                        email: cubit.emailController.text,
                                        password: cubit.passwordController.text,
                                        rePassword: cubit.rePasswordController.text,
                                        height: cubit.height,
                                        weight: cubit.weight,
                                        age: cubit.age,
                                        goal: cubit.goal,
                                        activityLevel: cubit.activityLevel,
                                        gender:
                                            RegisterCubit.selectedGender.name,
                                      );
                                      cubit.doIntent(
                                        RegisterUserIntent(request: request),
                                      );
                                      print(request.toJson());
                                    },
                                    child: const Text('Next'),
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
