import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/core/utils/widgets/youtube_video_player_dialog.dart';
import 'package:fitness_app/features/home/home/data/models/exercises.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
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
          final exercise = exercises[index];
          final videoUrl = exercise.shortYoutubeDemonstrationLink;
          final image =
              (videoUrl != null && videoUrl.isNotEmpty)
                  ? getYouTubeThumbnail(videoUrl)
                  : "https://img.youtube.com/vi/default.jpg";

          return YoutubeVideoPlayerDialog(
            youtubeUrl: videoUrl ?? '',
            child: RecommendationItem(
              name: exercise.exercise ?? "Exercise Not Found",
              image: image,
            ),
          );
        },
      ),
    );
  }
}
