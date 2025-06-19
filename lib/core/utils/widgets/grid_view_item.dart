import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: NetworkImage(
                  'https://i.pinimg.com/736x/64/eb/ef/64ebefbbd558d77f1a1e0d01a4e050c1.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          Positioned(bottom: 8,
              right: 20,
              left: 20,
              child: Column(
                children: [
                  Text(
                    'High Chest',
                    style: AppTextStyle.instance.textStyle16.copyWith(
                      color: AppColors.baseWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ), Text(
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
