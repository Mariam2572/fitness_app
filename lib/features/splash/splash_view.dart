import 'dart:async';

import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initSplash();
  }

  void initSplash() {
    Future.delayed(const Duration(seconds: 2), () async {
      final token = await readSecureData(Constants.userToken);
      if (token != null) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutesName.layOut);
        }
      } else {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutesName.onBoardingOne);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backGround,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 66,
                vertical: 160,
              ),
              child: Image.asset(AppAssets.fit, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
