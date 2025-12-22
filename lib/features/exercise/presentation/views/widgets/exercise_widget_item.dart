import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_image.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';

class ExerciseWidgetItem extends StatelessWidget {
  const ExerciseWidgetItem({super.key, required this.exercise});
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = getYouTubeThumbnail(
      exercise.shortYoutubeDemonstrationLink ?? "",
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExerciseImage(thumbnailUrl: thumbnailUrl),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.exercise ?? "",
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '3 Groups * 15 Times Lorem Ipsum Dolor Sit Amet Consectetur. Tempus',
                  softWrap: true,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          VideoPlayerWidget(exercise: exercise),
        ],
      ),
    );
  }
}
