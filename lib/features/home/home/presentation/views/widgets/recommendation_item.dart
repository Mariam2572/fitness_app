import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationItem extends StatelessWidget {
  final String name;
  final String image;

  const RecommendationItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: 104,
      margin: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(color: AppColors.mainRed),
                  ),
            ),
            // Blurred footer background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 35,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 6),
                    color: Colors.black.withOpacity(
                      0.3,
                    ), // translucent background
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: AppTextStyle.instance.textStyle14.copyWith(
                        fontWeight: FontWeight.w400,
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
    );
  }
}
