import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryItem.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ExerciseCategoriesWidget extends StatelessWidget {
  final List<CategoryData> categories;

  const ExerciseCategoriesWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12.h, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.neutral90,
        borderRadius: BorderRadius.circular(45).r,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((category) =>
            CategoryItem(
              imagePath: category.imagePath,
              label: category.label,
            ),
        ).toList(),
      ),
    );
  }
}