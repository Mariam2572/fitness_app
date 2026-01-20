import 'package:fitness_app/core/animation/page_fade_transition.dart';
import 'package:fitness_app/core/animation/page_slide_transition.dart';
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
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: RegisterScreen()),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.forgetPassword:
        return PageSlideTransition(
          page: ForgetPasswordScreen(),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.verifyCode:
        // Use fade transition for verification (dialog-like)
        return PageFadeTransition(
          page: VerificationScreen(),
          settings: settings,
        );
      case RoutesName.resetPaswword:
        // Use fade transition for reset password (confirmation screen)
        return PageFadeTransition(
          page: ResetPasswordScreen(),
          settings: settings,
        );
      case RoutesName.goals:
        final cubit = settings.arguments as RegisterCubit;
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: const GoalsScreen()),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.chooseGenderScreen:
        final cubit = settings.arguments as RegisterCubit;
        return PageSlideTransition(
          page: BlocProvider.value(
            value: cubit,
            child: const ChooseGenderScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.chooseAgeScreen:
        final cubit = settings.arguments as RegisterCubit;
        return PageSlideTransition(
          page: BlocProvider.value(
            value: cubit,
            child: const ChooseAgeScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.chooseWeightScreen:
        final cubit = settings.arguments as RegisterCubit;
        return PageSlideTransition(
          page: BlocProvider.value(
            value: cubit,
            child: const ChooseWeightScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.chooseHeightScreen:
        final cubit = settings.arguments as RegisterCubit;
        return PageSlideTransition(
          page: BlocProvider.value(
            value: cubit,
            child: const ChooseHeightScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.activities:
        final cubit = settings.arguments as RegisterCubit;
        return PageSlideTransition(
          page: BlocProvider.value(
            value: cubit,
            child: const ActivtiesScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editGender:
        final cubit = settings.arguments as EditProfileCubit;
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: const EditGender()),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editActivityLevel:
        final cubit = settings.arguments as EditProfileCubit;
        return PageSlideTransition(
          page: BlocProvider.value(
            value: cubit,
            child: const EditActivityLevel(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editAge:
        final cubit = settings.arguments as EditProfileCubit;
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: const EditAge()),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editGoals:
        final cubit = settings.arguments as EditProfileCubit;
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: const EditGoals()),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editWeight:
        final cubit = settings.arguments as EditProfileCubit;
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: const EditWeight()),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editHeight:
        final cubit = settings.arguments as EditProfileCubit;
        return PageSlideTransition(
          page: BlocProvider.value(value: cubit, child: const EditHeigth()),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.onBoardingOne:
        return PageSlideTransition(
          page: const OnBoardingScreen(),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.splash:
        return PageSlideTransition(
          page: const SplashView(),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.login:
        return PageSlideTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(getIt<LoginUsecase>()),
            child: const LoginScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.layOut:
        return PageSlideTransition(
          page: LayOut(),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.home:
        return PageSlideTransition(
          page: const HomeScreen(),
          direction: AxisDirection.left,
          settings: settings,
        );

      // case RoutesName.previousChatScreen:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return PageSlideTransition(
      //     page: PreviousConversationsScreen(
      //       onConversationSelected: args['onConversationSelected'],
      //     ),
      //     direction: AxisDirection.left,
      //   );

      case RoutesName.profile:
        return PageSlideTransition(
          page: const ProfileView(),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.workouts:
        return PageSlideTransition(
          page: BlocProvider(
            create:
                (context) => WorkOutsCubit(
                  getIt<GetAllMusclesGroupsUseCase>(),
                  getIt<GetAllMusclesByMuscleGroupIdUseCase>(),
                )..doIntent(GetAllMusclesGroupsIntent()),
            child: const WorkOutsView(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.smartCoach:
        return PageSlideTransition(
          page: const SmartCoachView(),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.exerciseView:
        return PageSlideTransition(
          page: const ExerciseView(),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.food:
        return PageSlideTransition(
          page: const FoodRecommendationView(),
          direction: AxisDirection.left,
          settings: settings,
        );

      case RoutesName.mealsDetailsScreen:
        return PageSlideTransition(
          page: const MealsDetailsScreen(),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.changePassword:
        return PageSlideTransition(
          page: BlocProvider(
            create: (_) => ChangePasswordCubit(getIt<ChangePasswordUseCase>()),
            child: const ChangePasswordScreen(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );
      case RoutesName.editProfile:
        return PageSlideTransition(
          page: BlocProvider(
            create:
                (context) => EditProfileCubit(
                  getIt<EditProfileUseCase>(),
                  getIt<GetLoggedUserDataUseCase>(),
                  getIt<UploadPhotoUseCase>(),
                )..doIntent(GetLoggedUserDataIntent()),
            child: const EditProfileView(),
          ),
          direction: AxisDirection.left,
          settings: settings,
        );
      default:
        return null;
    }
  }
}
