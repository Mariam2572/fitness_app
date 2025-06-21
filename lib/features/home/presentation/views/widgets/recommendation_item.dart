import 'dart:ui';

import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class RecommendationItem extends StatelessWidget {
  final String name;
  final String image;
  const RecommendationItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 104,
      width: 104,

      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(45)),
        child: Stack(
          children: [
             Positioned.fill(
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                  bottom: Radius.circular(0),
                ),

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  name,
                  style: AppTextStyle.instance.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.baseWhite,
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
