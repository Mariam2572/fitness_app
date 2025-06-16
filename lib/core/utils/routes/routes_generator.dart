import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_gender_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_weight_screen.dart';
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
        case RoutesName.chooseGenderScreen:
        return MaterialPageRoute(
          builder: (context) => const  ChooseGenderScreen(),
          settings: settings,
        );
         case RoutesName.chooseAgeScreen:
        return MaterialPageRoute(
          builder: (context) => const  ChooseAgeScreen(),
          settings: settings,
        );
         case RoutesName.chooseWeightScreen:
        return MaterialPageRoute(
          builder: (context) => const  ChooseWeightScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
