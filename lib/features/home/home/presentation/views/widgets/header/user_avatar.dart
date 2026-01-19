import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/shimmer_config.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// User avatar widget with loading state
class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final bool isLoading;
  final double radius;

  const UserAvatar({
    super.key,
    this.imageUrl,
    this.isLoading = false,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Skeletonizer(
        enabled: true,
        effect: HomeShimmerConfig.shimmerEffect,
        child: CircleAvatar(radius: radius),
      );
    }

    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(radius: radius);
    }

    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(imageUrl!),
    );
  }
}
