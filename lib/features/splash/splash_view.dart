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
    checkAuth();
    super.initState();
  }
  checkAuth() async {
    final token = await readSecureData(Constants.userToken);
    Timer(const Duration(seconds: 2), () {
      if (token != null) {
        Navigator.pushReplacementNamed(context, RoutesName.layOut);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.backGround),
        Padding(
          padding: const EdgeInsets.only(
            right: 66,
            left: 66,
            top: 160,
            bottom: 160,
          ),
          child: Center(
            child: Container(
              // height: 243,
              // width: 151,
              child: Image.asset(AppAssets.fit, fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ],
    );
  }
}
