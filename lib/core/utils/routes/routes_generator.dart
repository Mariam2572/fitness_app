import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/feature/login/domain/usecases/login_usecase.dart';
import 'package:fitness_app/feature/login/presentation/view/login_screen.dart';
import 'package:fitness_app/feature/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
          settings: settings,
        );
        case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt<LoginUsecase>()),
            child: const LoginScreen(),
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
