import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<void> writeSecureData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    final String? value = await secureStorage.read(key: key);
    return value;
  }
}
