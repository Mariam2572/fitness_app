import 'package:fitness_app/core/utils/Error/error_handler.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T? data;
  const ApiSuccess({this.data});
}

class ApiError<T> extends ApiResult<T> {
  final String? message;
  final Failure? failure;
  const ApiError({this.message, this.failure});
}
