import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart'
    show RegisterCubit;
import 'package:fitness_app/features/auth/register/presentation/views/actvities_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/views/goals_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_screen.dart';
import 'package:fitness_app/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.onBoarding:
      //   return MaterialPageRoute(
      //     builder: (context) => const Onboarding(),
      //     settings: settings,
      //   );
      // case RoutesName.register:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       final registerCubit = RegisterCubit(getIt<RegisterUseCase>());
      //       return BlocProvider.value(
      //         value: registerCubit,
      //         child: const RegisterScreen(),
      //       );
      //     },
      //     settings: settings,
      //   );
      // case RoutesName.goals:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       final registerCubit = context.read<RegisterCubit>();
      //       return BlocProvider.value(
      //         value: registerCubit,
      //         child: const GoalsScreen(),
      //       );
      //     },
      //     settings: settings,
      //   );

      // case RoutesName.activities:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       final registerCubit = context.read<RegisterCubit>();
      //       return BlocProvider.value(
      //         value: registerCubit,
      //         child: const ActivtiesScreen(),
      //       );
      //     },
      //     settings: settings,
      //   );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) {
            // final registerCubit = RegisterCubit(getIt<RegisterUseCase>());
            return const RegisterScreen();
          },
          settings: settings,
        );
      case RoutesName.goals:
        return MaterialPageRoute(
          builder: (context) {
            // final registerCubit = context.read<RegisterCubit>();
            return const GoalsScreen();
          },
          settings: settings,
        );

      case RoutesName.activities:
        return MaterialPageRoute(
          builder: (context) {
            // final registerCubit = context.read<RegisterCubit>();
            return const ActivtiesScreen();
          },
          settings: settings,
        );

      default:
        return null;
    }
  }
}
