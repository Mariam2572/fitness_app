
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItem({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image Container
          Container(
            width: 62.w,
            height: 62.h,
            decoration: BoxDecoration(
              color: AppColors.neutral90,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback to icon if image not found
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.neutral70,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
          ),

          // Label
          Text(
            label,
            style:AppTextStyle.instance.textStyle16.copyWith(
              fontWeight: FontWeight.w400
            )
          ),
        ],
      ),
    );
  }
}

