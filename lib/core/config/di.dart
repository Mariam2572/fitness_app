
import 'package:fitness_app/core/config/di.config.dart';
import 'package:fitness_app/core/provider/app_config_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
final getIt = GetIt.instance;


@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

@module
abstract class AppModule {
  @lazySingleton
  AppConfigProvider get appConfigProvider => AppConfigProvider();
}
