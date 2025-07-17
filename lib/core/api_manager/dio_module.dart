import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/provider/app_config_provider.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  LogInterceptor provideLogger() {
    return LogInterceptor(requestBody: true, responseBody: true);
  }

  @Singleton()
  Dio provideDio(LogInterceptor logInterceptor,AppConfigProvider appConfigProvider) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        baseUrl: Constants.baseUrl,
      ),
    );
    dio.options.headers["Content-Type"]="multipart/form-data";
    dio.options.contentType="multipart/form-data";
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await readSecureData(Constants.userToken);

          log("token : $token");
          options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjg1NTgyZDVkYjY1MjAwNTE0NDE2N2QxIiwiaWF0IjoxNzUyNDMxNDcxfQ.sEeuU8Ifkm7HEh4-oRyL9xouiUYw6G8ZZ2EDdh5FL54';
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjg1NTgyZDVkYjY1MjAwNTE0NDE2N2QxIiwiaWF0IjoxNzUyNDMxNDcxfQ.sEeuU8Ifkm7HEh4-oRyL9xouiUYw6G8ZZ2EDdh5FL54';
            log("token : $token");
          }
          options.headers['Accept-Language'] = appConfigProvider.appLanguage;
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
  @Singleton()
  MealApiService provideMealApiService(Dio dio) {
    return MealApiService(dio);
  }
}
