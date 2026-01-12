import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/youtube_video_player_dialog.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidgetWithLink extends StatelessWidget {
  const VideoPlayerWidgetWithLink({super.key, required this.link});
  final String link;

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoPlayerDialog(
      youtubeUrl: link,
      child: const CircleAvatar(
        backgroundColor: AppColors.mainRed,
        radius: 15,
        child: Icon(Icons.play_arrow, color: AppColors.neutral90, size: 30),
      ),
    );
  }
}
