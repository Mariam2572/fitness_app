import 'package:fitness_app/features/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingWorkout extends StatelessWidget {
  final List<MusclesBean> muscles;

  const UpcomingWorkout({super.key, required this.muscles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: muscles.length,

        itemBuilder: (context, index) {
          return HomeUpcomingWorkoutItem(
            name: muscles[index].name ?? "Exercise Name Not Found",
            image:muscles[index].image ?? "Image Not Found", muscle: muscles[index],
                
          );
        },
      ),
    );
  }
}
