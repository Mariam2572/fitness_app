import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CalAndTimeSection extends StatelessWidget {
  const CalAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.neutral0, width: 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        '30 MIN',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.baseWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.neutral0,
                          width: .5,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        '130 Cal',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.mainRed,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ;
  }
}