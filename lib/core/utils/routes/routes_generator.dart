import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/feature/home/home_view.dart';
import 'package:fitness_app/feature/layOut/lay_out.dart';
import 'package:fitness_app/feature/profile/profile_view.dart';
import 'package:fitness_app/feature/smartCoach/smart_coach_view.dart';
import 'package:fitness_app/feature/workOuts/work_outs_view.dart';
import 'package:fitness_app/feature/login/domain/usecases/login_usecase.dart';
import 'package:fitness_app/feature/login/presentation/view/login_screen.dart';
import 'package:fitness_app/feature/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/feature/onBoarding/on_boarding_one.dart';
import 'package:fitness_app/feature/onBoarding/on_boarding_three.dart';
import 'package:fitness_app/feature/onBoarding/on_boarding_two.dart';
import 'package:fitness_app/feature/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case RoutesName.login:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(getIt<LoginUsecase>()),
                child: const LoginScreen(),
              ),
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
