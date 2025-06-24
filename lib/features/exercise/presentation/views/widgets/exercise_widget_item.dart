import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';

class ExerciseWidgetItem extends StatefulWidget {
  const ExerciseWidgetItem({super.key, required this.exercise});
  final Exercise exercise;

  @override
  State<ExerciseWidgetItem> createState() => _ExerciseWidgetItemState();
}

class _ExerciseWidgetItemState extends State<ExerciseWidgetItem> {
  YoutubePlayerController? _youtubeController;

  void showVideoDialog() {
    final videoId = YoutubePlayer.convertUrlToId(
      widget.exercise.shortYoutubeDemonstrationLink ?? '',
    );

    if (videoId == null) return;
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        // autoPlay: true,
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
                  color: const Color(0xFF000000).withOpacity(0.2),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 88,
                width: 81,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: CachedNetworkImage(
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainRed,
                      ),
                    );
                  },
                  imageUrl: getYouTubeThumbnail(
                    widget.exercise.shortYoutubeDemonstrationLink ?? "",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.exercise.exercise ?? 'Exercise Name',
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
              GestureDetector(
                onTap: showVideoDialog,
                child: const CircleAvatar(
                  backgroundColor: AppColors.mainRed,
                  radius: 15,
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.neutral90,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
