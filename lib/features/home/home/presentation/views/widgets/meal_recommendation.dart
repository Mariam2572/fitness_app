import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealRecommendation extends StatelessWidget {
  final List<FoodCategory> mealCategories;

  const MealRecommendation({super.key, required this.mealCategories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealCategories.length,

        itemBuilder: (context, index) {
          return RecommendationItem(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.food);
            },
            name: mealCategories[index].strCategory ?? "Name Not Found",
            image: mealCategories[index].strCategoryThumb ?? "Image Not Found",
          );
        },
      ),
    );
  }
}
