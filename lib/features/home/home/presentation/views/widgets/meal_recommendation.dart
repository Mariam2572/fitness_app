import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealRecommendation extends StatelessWidget {
  MealRecommendation({super.key});

  final List<String> names = [
    "Breakfast",
    "Lunch",
    "Dinner"
  ];
  final List<String> image = [
    "assets/images/breakfast-recommendation.png",
    "assets/images/lunch-recommendation.png",
    "assets/images/dinner-recommendation.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemCount = names.length;
          final itemSpacing = 12.w;
          final totalSpacing = itemSpacing * (itemCount - 1);
          final itemWidth = (constraints.maxWidth - totalSpacing) / itemCount;

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            separatorBuilder: (_, __) => SizedBox(width: itemSpacing),
            itemBuilder: (context, index) {
              return SizedBox(
                width: itemWidth,
                child: HomeUpcomingWorkoutItem(
                  name: names[index],
                  image: image[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
