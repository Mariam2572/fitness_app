import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad SSL certificate error');
      case DioExceptionType.badResponse:
        // here i need to check on response and statuscode
        return ServerFailure.fromResponse(
          dioExcep.response!.statusCode!,
          dioExcep.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'There is no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: 'UnExcepted error , Please try again',
        );
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic jsonData) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        if (jsonData["message"] != null &&
            jsonData["message"].toString().contains(
              "fails to match the required pattern",
            )) {
          return ServerFailure(
            errorMessage:
                "Password must contain at least:\n - 8 characters\n - One uppercase letter\n - One lowercase letter\n - One number\n - One special character.",
          );
        } else if (jsonData["error"]?.toString().contains(
              'Reset code is invalid or has expired',
            ) ??
            false) {
          return ServerFailure(
            errorMessage:
                jsonData["message"]?.toString() ??
                jsonData["error"]?.toString() ??
                "Unknown error",
          );
        }
        return ServerFailure(
          errorMessage:
              jsonData["message"]?.toString() ??
              jsonData["error"]?.toString() ??
              "Unknown error",
        );

      case 404:
        if (jsonData["message"] != null &&
            jsonData["message"].toString().contains(
              'There is no account with this email address',
            )) {
          return ServerFailure(
            errorMessage:
                jsonData["message"]?.toString() ??
                jsonData["error"]?.toString() ??
                "Unknown error",
          );
        } else if (jsonData["error"]?.toString().contains(
              "There is no account with this email address",
            ) ??
            false) {
          return ServerFailure(
            errorMessage:
                jsonData["message"]?.toString() ??
                jsonData["error"]?.toString() ??
                "Unknown error",
          );
        } else {
          return ServerFailure(errorMessage: 'Requested resource not found.');
        }

      case 409:
        return ServerFailure(errorMessage: 'Account Already Exists.');

      case 500:
        return ServerFailure(
          errorMessage: 'Internal server error. Please try again later.',
        );

      default:
        return ServerFailure(
          errorMessage: 'Unexpected error. Status Code: $statusCode',
        );
    }
  }
}
