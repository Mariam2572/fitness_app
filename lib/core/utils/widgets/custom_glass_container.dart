import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:flutter/material.dart';

class CustomGlassContainer extends StatelessWidget {
  const CustomGlassContainer({super.key, required this.child, this.height});
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 34.6, sigmaY: 34.6),
        child: SizedBox(
          width: double.infinity,
          height: height ?? context.height * 0.45,
          child: child,
        ),
      ),
    );
  }
}
