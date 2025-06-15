import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/onBoarding/on_boarding_one.dart';
import 'package:fitness_app/features/onBoarding/on_boarding_three.dart';
import 'package:fitness_app/features/onBoarding/on_boarding_two.dart';
import 'package:fitness_app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoardingOne:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingOne(),
          settings: settings,
        );
      case RoutesName.onBoardingTwo:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingTwo(),
          settings: settings,
        );
      case RoutesName.onBoardingThree:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingThree(),
          settings: settings,
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
