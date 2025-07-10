import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingWorkout extends StatelessWidget {
  final List<Exercises> exercises;

  const UpcomingWorkout({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exercises.length,

        itemBuilder: (context, index) {
          return HomeUpcomingWorkoutItem(
            name: exercises[index].exercise ?? "Exercise Name Not Found",
            image:
                getYouTubeThumbnail(
                  exercises[index].shortYoutubeDemonstrationLink ?? '',
                ) ??
                "https://img.youtube.com/vi/DEFAULT_THUMBNAIL/hqdefault.jpg",
          );
        },
      ),
    );
  }
}
