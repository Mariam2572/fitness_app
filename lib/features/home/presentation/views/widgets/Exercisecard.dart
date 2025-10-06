import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String taskCount;
  final String level;
  final String imagePath;

  const ExerciseCard({
    Key? key,
    required this.title,
    required this.taskCount,
    required this.level,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    return SizedBox(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.baseBlack.withValues(alpha: 0.3),
                      AppColors.baseBlack.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: REdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.neutral90.withValues(alpha: 0.7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Text(taskCount, style: text.bodySmall),
                        ),
                        Container(
                          padding: REdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.neutral90.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            level,
                            style: text.bodySmall?.copyWith(
                              color: AppColors.mainRed,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
