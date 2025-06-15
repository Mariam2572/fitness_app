import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_gender_screen.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) =>  Onboarding(),
          settings: settings,
        );
        case RoutesName.chooseGenderScreen:
        return MaterialPageRoute(
          builder: (context) =>  ChooseGenderScreen(),
          settings: settings,
        );
         case RoutesName.chooseAgeScreen:
        return MaterialPageRoute(
          builder: (context) =>  ChooseAgeScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
