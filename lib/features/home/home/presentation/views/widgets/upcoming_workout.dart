import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingWorkout extends StatelessWidget {
  const UpcomingWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child:const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          // Wrap each in Expanded or Flexible if needed
          Expanded(
            child: HomeUpcomingWorkoutItem(
              name: "Chest",
              image: "assets/images/Chest-Upcoming.jpg",
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: HomeUpcomingWorkoutItem(
              name: "Back",
              image: "assets/images/back-upcoming.jpg",
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: HomeUpcomingWorkoutItem(
              name: "Arms",
              image: "assets/images/arms-upcoming.jpg",
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: HomeUpcomingWorkoutItem(
              name: "Legs",
              image: "assets/images/legs-upcoming.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
