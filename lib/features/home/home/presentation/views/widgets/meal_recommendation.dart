import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MealRecommendation extends StatelessWidget {
  final List<FoodCategory> mealCategories;

  const MealRecommendation({super.key, required this.mealCategories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mealCategories.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100.w, // fixed width for better visibility
            child: HomeUpcomingWorkoutItem(
              name: mealCategories[index].strCategory ?? "Name Not Found",
              image: mealCategories[index].strCategoryThumb ?? "Image Not Found",
            ),
          );
        },
      ),
    );
  }
}
