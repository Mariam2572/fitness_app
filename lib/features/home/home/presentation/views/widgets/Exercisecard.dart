import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String taskCount;
  final String level;
  final String imagePath;
  final bool isImageLeft;

  const ExerciseCard({
    Key? key,
    required this.title,
    required this.taskCount,
    required this.level,
    required this.imagePath,
    required this.isImageLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha :0.3),
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Title
                    Text(
                      title,
                      style: AppTextStyle.instance.textStyle16.copyWith(
                        fontWeight: FontWeight.w600
                      )
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: REdgeInsets.all(5),
                          decoration:  BoxDecoration(
                            color: AppColors.neutral90.withValues(alpha :0.7),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                          child: Text(
                            taskCount,
                            style: AppTextStyle.instance.textStyle12
                          ),
                        ),
                        Container(
                          padding:  REdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.neutral90.withValues(alpha :0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            level,
                              style: AppTextStyle.instance.textStyle12.copyWith(
                              color: AppColors.mainRed
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
