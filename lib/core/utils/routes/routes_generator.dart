import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => Onboarding(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
