import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeUpcomingWorkoutItem extends StatelessWidget {
  final String name;
  final String image;
  final MusclesBean muscle;
  final void Function()? onTap;
  const HomeUpcomingWorkoutItem({
    super.key,
    required this.name,
    required this.image, required this.muscle, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                    errorWidget:
                        (context, url, error) => const Icon(
                          Icons.error,
                          color: AppColors.neutral40,
                          size: 45
                        ),
                    placeholder:
                        (context, url) => Skeletonizer(
                          child: Container(
                            color: AppColors.neutral90With50Opacity,
                          ),
                        ),
                  ),
                ),
        
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 25,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        color: AppColors.neutral90With50Opacity,
                        alignment: Alignment.center,
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.baseWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
