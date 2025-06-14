import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio;

  ApiManager({required this.dio});
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? params,
  }) {
    final response = dio.get(endPoint, queryParameters: params);
    return response;
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) {
    final response = dio.post(endPoint, data: data);
    return response;
  }

  Future<Response> putRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await dio.put(endpoint, data: data);
    return response;
  }

  Future<Response> patchRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await dio.patch(endpoint, data: data);
    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    final response = await dio.delete(endpoint);
    return response.data as Response;
  }
}
