import 'dart:ui';

import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeUpcomingWorkoutItem extends StatelessWidget {
  const HomeUpcomingWorkoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 80,
      width: 80,

      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(45)),
        child: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'upcoming workout item',
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
