import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.exercise});
  final Exercise exercise;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  YoutubePlayerController? _youtubeController;

  void showVideoDialog() {
    final videoId = YoutubePlayer.convertUrlToId(
      widget.exercise.shortYoutubeDemonstrationLink ?? '',
    );

    if (videoId == null) return;
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        // controlsVisibleAtStart: true,
      ),
    );
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.baseBlack, AppColors.neutral90],
              ),

              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withValues(alpha: 0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: context.height * 0.40,
            width: context.width,
            child: YoutubePlayer(
              controller: _youtubeController!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: AppColors.baseWhite,
            ),
          ),
        );
      },
    ).then((_) {
      _youtubeController?.pause();
      _youtubeController?.dispose();
      _youtubeController = null;
    });
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showVideoDialog,
      child: const CircleAvatar(
        backgroundColor: AppColors.mainRed,
        radius: 15,
        child: Icon(Icons.play_arrow, color: AppColors.neutral90, size: 30),
      ),
    );
  }
}
