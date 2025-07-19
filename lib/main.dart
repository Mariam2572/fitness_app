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
import 'package:fitness_app/features/smartCoach/data/models/ChatMessageHiveModel.dart';
import 'package:fitness_app/features/smartCoach/data/models/ConversationHiveModel.dart';
import 'package:fitness_app/features/smartCoach/domain/use_case/send_message_use_case.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final geminiService = getIt<GeminiService>();
  await geminiService.initialize();

  await Hive.initFlutter();
  Hive.registerAdapter(ChatMessageHiveModelAdapter());
  Hive.registerAdapter(ConversationHiveModelAdapter());
  await Hive.openBox<ConversationHiveModel>('conversations');

  final conversationBox = await Hive.openBox<ConversationHiveModel>(
    'conversations',
  );
  getIt.registerSingleton<Box<ConversationHiveModel>>(conversationBox);
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppConfigProvider(),
      child: const MyApp(),
    ),
  );
  Bloc.observer = SimpleBlocObserver();
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
              create: (context) => SmartCoachCubit(getIt<SendMessageUseCase>()),
            ),
            BlocProvider(create: (context) =>FoodCubit(
                getIt.get<GetFoodCategoriesUseCase>(),
                getIt.get<GetMealsByCategoryUseCase>(),
              ),),
          ],
          child: MaterialApp(
            locale: Locale(provider.appLanguage),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesGenerator.onGenerator,
            theme: AppTheme.appTheme,
            initialRoute: RoutesName.login,
          ),
        );
      },
    );
  }
}
