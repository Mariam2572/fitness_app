import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/youtube_video_player_dialog.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key, required this.exercise});
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoPlayerDialog(
      youtubeUrl: exercise.shortYoutubeDemonstrationLink ?? '',
      child: const CircleAvatar(
        backgroundColor: AppColors.mainRed,
        radius: 15,
        child: Icon(Icons.play_arrow, color: AppColors.neutral90, size: 30),
      ),
    );
  }
}
