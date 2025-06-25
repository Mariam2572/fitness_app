import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final String name;
  final String image;
  final MusclesBean muscle;
  const GridViewItem({
    super.key,
    required this.name,
    required this.image,
    required this.muscle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.exerciseView,arguments: muscle);
      },
      child: Container(
        height: 163,
        width: 160,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fill,
                  placeholder:
                      (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainRed,
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.instance.textStyle16.copyWith(
                        color: AppColors.baseWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Exercise',
                      style: AppTextStyle.instance.textStyle16.copyWith(
                        color: AppColors.baseWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
