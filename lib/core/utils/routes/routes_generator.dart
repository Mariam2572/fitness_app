import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/change%20password/domain/usecase/change_passwrod_usecase.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_cubit.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view/change_password_screen.dart';
import 'package:fitness_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:fitness_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_height_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_weight_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/views/actvities_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/views/goals_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_gender_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_sreen.dart';
import 'package:fitness_app/features/exercise/presentation/views/exercise_view.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart'
    show GetFoodCategoriesUseCase;
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/food.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/meals_details_screen.dart';
import 'package:fitness_app/features/home/home/presentation/views/home_view.dart';
import 'package:fitness_app/features/layOut/lay_out.dart';
import 'package:fitness_app/features/onBoarding/on_boarding_screen.dart';
import 'package:fitness_app/features/profile/presentation/view/profile_view.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/smart_coach_view.dart';
import 'package:fitness_app/features/splash/splash_view.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:fitness_app/features/workOuts/presentation/view_model/cubit/work_outs_cubit.dart';
import 'package:fitness_app/features/workOuts/presentation/views/work_outs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.register:
        final cubit = RegisterCubit(getIt<RegisterUseCase>());
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(value: cubit, child: RegisterScreen()),
          settings: settings,
        );

      case RoutesName.goals:
        final cubit = settings.arguments as RegisterCubit;
        return MaterialPageRoute(
          builder:
              (_) =>
                  BlocProvider.value(value: cubit, child: const GoalsScreen()),
          settings: settings,
        );

      case RoutesName.chooseGenderScreen:
        final cubit = settings.arguments as RegisterCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const ChooseGenderScreen(),
              ),
          settings: settings,
        );

      case RoutesName.chooseAgeScreen:
        final cubit = settings.arguments as RegisterCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const ChooseAgeScreen(),
              ),
          settings: settings,
        );

      case RoutesName.chooseWeightScreen:
        final cubit = settings.arguments as RegisterCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const ChooseWeightScreen(),
              ),
          settings: settings,
        );

      case RoutesName.chooseHeightScreen:
        final cubit = settings.arguments as RegisterCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const ChooseHeightScreen(),
              ),
          settings: settings,
        );

      case RoutesName.activities:
        final cubit = settings.arguments as RegisterCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const ActivtiesScreen(),
              ),
          settings: settings,
        );

      case RoutesName.onBoardingOne:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
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

      case RoutesName.previousChatScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => PreviousConversationsScreen(
                onConversationSelected: args['onConversationSelected'],
              ),
          settings: settings,
        );

      case RoutesName.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: settings,
        );

      case RoutesName.workouts:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) => WorkOutsCubit(
                      getIt<GetAllMusclesGroupsUseCase>(),
                      getIt<GetAllMusclesByMuscleGroupIdUseCase>(),
                    )..doIntent(GetAllMusclesGroupsIntent()),
                child: const WorkOutsView(),
              ),
          settings: settings,
        );
      case RoutesName.smartCoach:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => SmartCoachView(
                messages: args['messages'],
                onSessionEnd: args['onSessionEnd'],
                previousConversationViewModel:
                    args['previousConversationViewModel'],
              ),
          settings: settings,
        );
      case RoutesName.exerciseView:
        return MaterialPageRoute(
          builder: (context) => const ExerciseView(),
          settings: settings,
        );

      case RoutesName.mealsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const MealsDetailsScreen(),
          settings: settings,
        );
      case RoutesName.changePassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (_) => ChangePasswordCubit(getIt<ChangePasswordUseCase>()),
                child: const ChangePasswordScreen(),
              ),
          settings: settings,
        );


      case RoutesName.food:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (_) => FoodCubit(
                      getIt<GetFoodCategoriesUseCase>(),
                      getIt<GetMealsByCategoryUseCase>(),
                    ),
                child: const FoodRecommendationPage(),
              ),
        );
      default:
        return null;
    }
  }
}
