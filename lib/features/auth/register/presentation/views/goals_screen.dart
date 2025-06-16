import 'dart:ui';

import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';

import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/register_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  String? selectedGoal = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/regester_background.png",
              fit: BoxFit.cover,
            ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.25),

                      Image.asset("assets/images/fit 1.png", width: 80),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                  ProgressCircleIndicator(
                    label: '5/6',
                    value: 5 / 6,
                    angle: 4.2,
                    progressColor: AppColors.mainRed,
                    textStyle: AppTextStyle.instance.textStyle16.copyWith(
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  Text(
                    'WHAT IS YOUR GOAL ?',
                    style: AppTextStyle.instance.textStyle20.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'This Helps Us Create Your Personalized Plan',
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
                        child: Column(
                          children: [
                            GoalOptionItem(
                              label: 'Gain Weight',
                              selectedValue: selectedGoal,
                              onChanged: (value) {
                                setState(() {
                                  selectedGoal = value!;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GoalOptionItem(
                              label: 'Lose Weight',
                              selectedValue: selectedGoal,
                              onChanged: (value) {
                                setState(() {
                                  selectedGoal = value!;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GoalOptionItem(
                              label: 'Get Fitter',
                              selectedValue: selectedGoal,
                              onChanged: (value) {
                                setState(() {
                                  selectedGoal = value!;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GoalOptionItem(
                              label: 'Gain More Flexible',
                              selectedValue: selectedGoal,
                              onChanged: (value) {
                                setState(() {
                                  selectedGoal = value!;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GoalOptionItem(
                              label: 'Learn The Basic',
                              selectedValue: selectedGoal,
                              onChanged: (value) {
                                setState(() {
                                  selectedGoal = value!;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.activities,
                                );
                              },
                              child: const Text('Next'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
