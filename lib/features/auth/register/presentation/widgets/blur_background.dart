import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  final String imagePath;
  final double blurSigma;
  final double overlayOpacity;

  const BlurredBackground({
    super.key,
    required this.imagePath,
    this.blurSigma = 7,
    this.overlayOpacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(color: Colors.black.withValues(alpha: 0)),
          ),
        ),
        Positioned.fill(
          child: Container(color: Colors.black.withValues(alpha: overlayOpacity)),
        ),
      ],
    );
  }
}
