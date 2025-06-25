import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final String name;
  final String image;
  const GridViewItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image(image: NetworkImage(image), fit: BoxFit.fill),
            ),
            Positioned(
              bottom: 8,
              right: 20,
              left: 20,
              child: Column(
                children: [
                  Text(
                    name,
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
    );
  }
}
