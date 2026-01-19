import 'package:flutter/material.dart';

/// Reusable skeleton container for loading states
/// Provides consistent skeleton boxes across the Home feature
class SkeletonContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const SkeletonContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 25,
    this.margin,
    this.color = const Color(0xFF2A2A2A),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
