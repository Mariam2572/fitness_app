import 'dart:async';

import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/provider/app_config_provider.dart';
import 'package:fitness_app/core/utils/routes/routes_generator.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/services/gemini_service.dart';
import 'package:fitness_app/core/utils/simple_bloc_observer.dart';
import 'package:fitness_app/core/utils/theme/app_theme.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data_use_case.dart';
import 'package:fitness_app/features/smartCoach/data/models/conversation_hive_model.dart';
import 'package:fitness_app/features/smartCoach/data/repo/chat_history_repo.dart';
import 'package:fitness_app/features/smartCoach/domain/use_case/send_message_use_case.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  final geminiService = getIt<GeminiService>();
  await geminiService.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(ConversationHiveModelAdapter());
  Hive.registerAdapter(ChatMessageHiveModelAdapter());
  Bloc.observer = SimpleBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppConfigProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812), // match your design (e.g., Figma)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => SmartCoachCubit(
                    getIt<SendMessageUseCase>(),
                    getIt<ChatHistoryService>(),
                    getIt<GetProfileDataUseCase>(),
                  ),
            ),
            BlocProvider(
              create:
                  (context) => FoodCubit(
                    getIt.get<GetFoodCategoriesUseCase>(),
                    getIt.get<GetMealsByCategoryUseCase>(),
                  ),
            ),
          ],
          child: MaterialApp(
            locale: Locale(provider.appLanguage),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesGenerator.onGenerator,
            theme: AppTheme.appTheme,
            initialRoute: RoutesName.splash,
          ),
        );
      },
    );
  }
}
