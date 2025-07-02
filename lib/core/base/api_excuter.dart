import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/core/base/api_result.dart';

Future<ApiResult<T>> apiExecuter<T>(
  Future<T> Function() apiCall,
  String? source,
) async {
  try {
    final result = await apiCall.call();
    return ApiSuccess(data: result);
  } catch (e) {
    if (e is DioException) {
      return ApiError(failure: ServerFailure.fromDioException(e));
    } else {
      return ApiError(failure: ServerFailure(errorMessage: e.toString()));
    }
  }
}
