import 'package:fitness_app/features/home/home/presentation/views/widgets/common/shimmer_config.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/skeleton_container.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Skeleton loader for meals recommendations section
class MealsSkeletonLoader extends StatelessWidget {
  final int itemCount;

  const MealsSkeletonLoader({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: HomeShimmerConfig.shimmerEffect,
      child: SizedBox(
        height: 104,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return const SkeletonContainer(
              height: 110,
              width: 110,
              margin: EdgeInsets.only(right: 12),
            );
          },
        ),
      ),
    );
  }
}
