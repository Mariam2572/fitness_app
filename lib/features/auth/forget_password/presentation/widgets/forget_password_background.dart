import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';

class ForgetPasswordBackground extends StatelessWidget {
  const ForgetPasswordBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.authBackground,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
