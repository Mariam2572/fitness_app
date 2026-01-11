import 'package:skeletonizer/skeletonizer.dart';

/// Centralized shimmer effect configuration for Home feature
/// Provides consistent loading animations across all sections
class HomeShimmerConfig {
  HomeShimmerConfig._();

  /// Shimmer effect with improved visibility
  /// Uses darker base with lighter highlight for better contrast
  static const shimmerEffect = ShimmerEffect(
    baseColor: Color(0xFF2A2A2A), // Dark gray base
    highlightColor: Color(0xFF3F3F3F), // Lighter gray for contrast
  );
}
