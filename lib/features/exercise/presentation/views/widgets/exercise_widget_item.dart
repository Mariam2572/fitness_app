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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            height: 88,
            width: 81,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fill,

                image: NetworkImage(
                  getYouTubeThumbnail(
                    exercise.shortYoutubeDemonstrationLink ?? "",
                  ),
                ),
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
