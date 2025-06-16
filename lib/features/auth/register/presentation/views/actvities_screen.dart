import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart'
    show GoalOptionItem;
import 'package:fitness_app/features/auth/register/presentation/widgets/register_indicator.dart';

import 'package:flutter/material.dart';

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
          const BlurredBackground(
            imagePath: "assets/images/regester_background.png",
          ),
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
                              height: MediaQuery.of(context).size.height * 0.02,
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
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GoalOptionItem(
                              label: 'Intermediate',
                              selectedValue: selectedActivity,
                              onChanged: (value) {
                                setState(() {
                                  selectedActivity = value!;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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
                              height: MediaQuery.of(context).size.height * 0.02,
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
