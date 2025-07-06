import 'dart:ui';

import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUpcomingWorkoutItem extends StatelessWidget {
  final String name;
  final String image;

  const HomeUpcomingWorkoutItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Positioned.fill(child: Image.network(image, fit: BoxFit.cover)),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 25,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // Semi-transparent
                      alignment: Alignment.center,
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.instance.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.baseWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
