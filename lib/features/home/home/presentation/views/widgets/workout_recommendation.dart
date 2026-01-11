import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/features/home/home/data/models/exercises.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendations/workout_recommendation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutRecommendation extends StatelessWidget {
  final List<Exercises> exercises;
  const WorkoutRecommendation({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final videoUrl = exercises[index].shortYoutubeDemonstrationLink;
          final image =
              (videoUrl != null && videoUrl.isNotEmpty)
                  ? getYouTubeThumbnail(videoUrl)
                  : "https://img.youtube.com/vi/default.jpg";
          return RecommendationExerciseVideoPlayer(
            exercise: exercises[index],
            image: image,
          );
        },
      ),
    );
  }
}

