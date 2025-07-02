import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/provider/app_config_provider.dart';
import 'package:fitness_app/core/utils/routes/routes_generator.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/simple_bloc_observer.dart';
import 'package:fitness_app/core/utils/theme/app_theme.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
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
        return MaterialApp(
          locale: Locale(provider.appLanguage),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.onGenerator,
          theme: AppTheme.appTheme,
          initialRoute: RoutesName.splash,
        );
      },
    );
  }
}
