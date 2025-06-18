import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_gender_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_height_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_weight_screen.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_screen_body.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_sreen.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const  Onboarding(),
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
        case RoutesName.chooseHeightScreen:
        return MaterialPageRoute(
          builder: (context) => const  ChooseHeightScreen(),
          settings: settings,
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => RegisterCubit(getIt<RegisterUseCase>()),
                child: RegisterScreen(),
              ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
