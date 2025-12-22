import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidgetWithLink extends StatefulWidget {
  const VideoPlayerWidgetWithLink({super.key, required this.link});
  final String link;
  @override
  State<VideoPlayerWidgetWithLink> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidgetWithLink> {
  YoutubePlayerController? _youtubeController;

  void showVideoDialog() {
    final videoId = YoutubePlayer.convertUrlToId(widget.link);

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
