import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          return RecommendationExerciseVideoPlayer(exercise: exercises[index], image: image);
        },
      ),
    );
  }
}

class RecommendationExerciseVideoPlayer extends StatefulWidget {
  const RecommendationExerciseVideoPlayer({
    super.key,
    required this.exercise,
    required this.image,
  });

  final Exercises exercise;
  final String image;

  @override
  State<RecommendationExerciseVideoPlayer> createState() => _RecommendationExerciseVideoPlayerState();
}

class _RecommendationExerciseVideoPlayerState extends State<RecommendationExerciseVideoPlayer> {
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
    return RecommendationItem(
      onTap: () {
       showVideoDialog();
      },
      name: widget.exercise.exercise ?? "Exercise Not Found",
      image: widget.image,
    );
  }
}
