import 'package:fitness_app/features/home/home/presentation/views/widgets/common/shimmer_config.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/skeleton_container.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Skeleton loader for entire muscles groups section (tabs + workouts)
class MusclesGroupsSkeleton extends StatelessWidget {
  const MusclesGroupsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: HomeShimmerConfig.shimmerEffect,
      child: Column(
        children: [
          // Skeleton for tabs
          const SkeletonContainer(height: 40, borderRadius: 20),
          const SizedBox(height: 8),
          // Skeleton for workout items
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const SkeletonContainer(
                  width: 90,
                  margin: EdgeInsets.only(right: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
