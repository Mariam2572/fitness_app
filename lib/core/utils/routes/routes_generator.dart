import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/register/presentation/views/actvities_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/views/goals_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_screen.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.onBoarding:
      //   return MaterialPageRoute(
      //     builder: (context) => const Onboarding(),
      //     settings: settings,
      //   );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: settings,
        );
      case RoutesName.goals:
        return MaterialPageRoute(
          builder: (context) => const GoalsScreen(),
          settings: settings,
        );
      case RoutesName.activities:
        return MaterialPageRoute(
          builder: (context) => const ActivtiesScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
