import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.authBackGround,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
