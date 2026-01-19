import 'package:fitness_app/features/home/home/presentation/views/widgets/common/shimmer_config.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/skeleton_container.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Skeleton loader for workouts list (used in tab content)
class WorkoutsListSkeleton extends StatelessWidget {
  final int itemCount;

  const WorkoutsListSkeleton({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: HomeShimmerConfig.shimmerEffect,
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return const SkeletonContainer(
              width: 90,
              height: 90,
              margin: EdgeInsets.only(right: 16),
            );
          },
        ),
      ),
    );
  }
}
