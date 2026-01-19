import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/shimmer_config.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// User greeting widget with loading state
class UserGreeting extends StatelessWidget {
  final String? userName;
  final bool isLoading;
  final String? error;

  const UserGreeting({
    super.key,
    this.userName,
    this.isLoading = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;

    if (isLoading) {
      return Skeletonizer(
        enabled: true,
        effect: HomeShimmerConfig.shimmerEffect,
        child: Text(
          "${loc.hi} User,\n${loc.letsStartYourDay}",
          style: text.titleSmall?.copyWith(fontWeight: FontWeight.w500),
        ),
      );
    }

    if (error != null) {
      return Text(error!, style: text.bodyMedium);
    }

    return Text(
      "${loc.hi} ${userName ?? 'User'},\n${loc.letsStartYourDay}",
      style: text.titleSmall?.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
