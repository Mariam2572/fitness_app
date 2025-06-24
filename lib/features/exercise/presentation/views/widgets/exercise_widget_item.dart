import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
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
          Container(
            height: 88,
            width: 81,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            clipBehavior: Clip.antiAlias,
            child:
                thumbnailUrl.isNotEmpty
                    ? CachedNetworkImage(
                      imageUrl: thumbnailUrl,
                      fit: BoxFit.fill,
                      placeholder:
                          (context, url) => const Center(
                            child: CircularProgressIndicator.adaptive(
                              strokeWidth: 2,
                              constraints: BoxConstraints.tightFor(
                                width: 20,
                                height: 20,
                              ),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.mainRed,
                              ),
                              backgroundColor: AppColors.mainRed,
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                    )
                    : const Center(child: Icon(Icons.error, color: Colors.red)),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bench Press',
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
            onTap: () {},
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
    );
  }
}
