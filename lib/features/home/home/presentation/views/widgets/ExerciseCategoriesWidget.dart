import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryItem.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCategoriesWidget extends StatelessWidget {
  final List<CategoryData> categories;

  const ExerciseCategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      
      decoration: BoxDecoration(
        color: AppColors.neutral90,
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:
              categories
                  .map(
                    (category) => CategoryItem(
                      imagePath: category.imagePath,
                      label: category.label,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
