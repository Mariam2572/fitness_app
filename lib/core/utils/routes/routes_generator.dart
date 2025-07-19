import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/views/reset_password_screen.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/views/verification_screen.dart';
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
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view/food_recommendation_page.dart';
import 'package:fitness_app/features/food/presentation/view/food_recommendation_view.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/meals_details_screen.dart';
import 'package:fitness_app/features/home/home/presentation/views/home_screen.dart';
import 'package:fitness_app/features/layOut/lay_out.dart';
import 'package:fitness_app/features/onBoarding/on_boarding_screen.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/get_logged_user_data_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/upload_photo_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_activity_level.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_age.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_gender.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_goals.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_heigth.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_weight.dart';
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
      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
          settings: settings,
        );
      case RoutesName.verifyCode:
        return MaterialPageRoute(
          builder: (context) => VerificationScreen(),
          settings: settings,
        );
      case RoutesName.resetPaswword:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
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
      case RoutesName.editGender:
        final cubit = settings.arguments as EditProfileCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const EditGender(),
              ),
          settings: settings,
        );
      case RoutesName.editActivityLevel:
        final cubit = settings.arguments as EditProfileCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const EditActivityLevel(),
              ),
          settings: settings,
        );
      case RoutesName.editAge:
        final cubit = settings.arguments as EditProfileCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const EditAge(),
              ),
          settings: settings,
        );
      case RoutesName.editGoals:
        final cubit = settings.arguments as EditProfileCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const EditGoals(),
              ),
          settings: settings,
        );
      case RoutesName.editWeight:
        final cubit = settings.arguments as EditProfileCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const EditWeight(),
              ),
          settings: settings,
        );
      case RoutesName.editHeight:
        final cubit = settings.arguments as EditProfileCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const EditHeigth(),
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
          builder: (context) => const HomeScreen(),
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
      case RoutesName.food:
        return MaterialPageRoute(
          builder: (context) => const FoodRecommendationView(),
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
              (context) => BlocProvider(
                create:
                    (context) =>FoodCubit(getIt<GetFoodCategoriesUseCase>(), getIt<GetMealsByCategoryUseCase>()),
                child: const FoodRecommendationPage(),
              ),
          settings: settings,
        );
      case RoutesName.editProfile:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) => EditProfileCubit(
                      getIt<EditProfileUseCase>(),
                      getIt<GetLoggedUserDataUseCase>(),
                      getIt<UploadPhotoUseCase>(),
                    )..doIntent(GetLoggedUserDataIntent()),
                child: const EditProfileView(),
              ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
