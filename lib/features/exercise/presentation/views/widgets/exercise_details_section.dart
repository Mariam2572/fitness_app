import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/build_app_bar.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/cal_and_time_section.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseDetailsSection extends StatefulWidget {
  const ExerciseDetailsSection({super.key});

  @override
  State<ExerciseDetailsSection> createState() => _ExerciseDetailsSectionState();
}

class _ExerciseDetailsSectionState extends State<ExerciseDetailsSection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
          child: Image.asset(
            AppAssets.exercise,
            fit: BoxFit.cover,
            width: double.infinity,
            height: context.height * 0.5,
          ),
        ),
        
        Container(
          width: double.infinity,
          height: context.height * 0.50,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(36, 36, 36, 0.5),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Chest Exercise',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: AppColors.baseWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Lorem Ipsum Dolor Sit Amet Consectetur. Tempus Volutpat Ut Nisi Morbi.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.baseWhite,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                const CalAndTimeSection(),
                SizedBox(
                  height: context.height * 0.07,
                  child: AppTabBar(
                    tabViews: [
                      Text(
                        'Beginner',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text('Intermediate'),
                      const Text('Advanced'),
                      const Text('Beginner'),
                      const Text('Intermediate'),
                      const Text('Advanced'),
                    ],
                    controller: TabController(length: 6, vsync: this),
                    tabs: const [
                      'Beginner',
                      'Intermediate',
                      'Advanced',
                      'Beginner',
                      'Intermediate',
                      'Advanced',
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
