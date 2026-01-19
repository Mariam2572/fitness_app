import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import 'package:fitness_app/core/constants/constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadImageApiManager {
  final Dio dio;
  UploadImageApiManager(this.dio); // Injected

  Future<String> uploadImage(File image) async {
    final FormData data = FormData();
    data.files.add(
      MapEntry(
        "photo",
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split(".").first,
          contentType: MediaType("image", image.path.split(".").last),
        ),
      ),
    );
    final response = await dio.put(
      Constants.baseUrl +
          Constants.uploadPhotoEndPoint, // or whatever your endpoint is
      data: data,
    );

    if (response.statusCode == 200) {
      return response.data.toString(); // or extract the actual URL
    } else {
      throw Exception("Upload failed: ${response.statusCode}");
    }
  }
}
