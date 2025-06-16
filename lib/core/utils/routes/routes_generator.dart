import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/l10n/features/home/home_view.dart';
import 'package:fitness_app/l10n/features/layOut/lay_out.dart';
import 'package:fitness_app/l10n/features/profile/profile_view.dart';
import 'package:fitness_app/l10n/features/smartCoach/smart_coach_view.dart';
import 'package:fitness_app/l10n/features/workOuts/work_outs_view.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
          settings: settings,
        );

      case RoutesName.layOut:
        return MaterialPageRoute(
          builder: (context) => const LayOut(),
          settings: settings,
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case RoutesName.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: settings,
        );

      case RoutesName.workouts:
        return MaterialPageRoute(
          builder: (context) => const WorkOutsView(),
          settings: settings,
        );

      case RoutesName.smartCoach:
        return MaterialPageRoute(
          builder: (context) => const SmartCoachView(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
