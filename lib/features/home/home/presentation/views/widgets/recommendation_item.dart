import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendationItem extends StatelessWidget {
  final String name;
  final String image;
  final  Function()? onTap;

  const RecommendationItem({
    super.key,
    required this.name,
    required this.image, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        width: 110,
        margin: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                placeholder:
                    (context, url) =>  Skeletonizer(child: Container(color: AppColors.neutral90With50Opacity)),
              ),
      
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: REdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: AppColors.neutral90With50Opacity,
                        borderRadius: BorderRadius.circular(20),
                      ),
      
                      alignment: Alignment.center,
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.baseWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
