import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// A reusable widget that displays a YouTube video in a dialog when tapped.
///
/// This widget can be used in two ways:
/// 1. As a wrapper around a custom child widget (e.g., play button, thumbnail)
/// 2. Using the static method [showYoutubeVideoDialog] to show the dialog directly
///
/// Example with custom child:
/// ```dart
/// YoutubeVideoPlayerDialog(
///   youtubeUrl: 'https://youtube.com/watch?v=...',
///   child: Icon(Icons.play_arrow),
/// )
/// ```
///
/// Example with static method:
/// ```dart
/// YoutubeVideoPlayerDialog.showYoutubeVideoDialog(
///   context: context,
///   youtubeUrl: 'https://youtube.com/watch?v=...',
/// );
/// ```
class YoutubeVideoPlayerDialog extends StatefulWidget {
  const YoutubeVideoPlayerDialog({
    super.key,
    required this.youtubeUrl,
    this.child,
  });

  /// The YouTube URL or video link to play
  final String youtubeUrl;

  /// Optional child widget that triggers the video dialog when tapped.
  /// If not provided, a default play button will be shown.
  final Widget? child;

  /// Static method to show the YouTube video dialog directly.
  ///
  /// This is useful when you want to show the video dialog programmatically
  /// without wrapping a widget.
  static void showYoutubeVideoDialog({
    required BuildContext context,
    required String youtubeUrl,
  }) {
    final videoId = YoutubePlayer.convertUrlToId(youtubeUrl);

    if (videoId == null) return;

    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
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
              controller: controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: AppColors.baseWhite,
            ),
          ),
        );
      },
    ).then((_) {
      controller.pause();
      controller.dispose();
    });
  }

  @override
  State<YoutubeVideoPlayerDialog> createState() =>
      _YoutubeVideoPlayerDialogState();
}

class _YoutubeVideoPlayerDialogState extends State<YoutubeVideoPlayerDialog> {
  YoutubePlayerController? _youtubeController;

  void _showVideoDialog() {
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);

    if (videoId == null) return;

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
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
      onTap: _showVideoDialog,
      child:
          widget.child ??
          const CircleAvatar(
            backgroundColor: AppColors.mainRed,
            radius: 15,
            child: Icon(Icons.play_arrow, color: AppColors.neutral90, size: 30),
          ),
    );
  }
}
