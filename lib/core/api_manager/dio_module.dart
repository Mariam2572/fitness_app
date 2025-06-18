import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor(requestBody: true, responseBody: true);
  }

  @Singleton()
  Dio provideDio(LogInterceptor logInterceptor) {
    Dio provideDio(LogInterceptor logInterceptor) {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 60),
          baseUrl: Constants.baseUrl,
        ),
      );

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = await readSecureData(Constants.userToken);
            final token = await readSecureData(Constants.userToken);
            log("token : $token");
            options.headers['Authorization'] = 'Bearer $token';
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              log("token : $token");
            }
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
  }
}
