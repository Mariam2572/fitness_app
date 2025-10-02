import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/app_keys.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@singleton
class GeminiService {
  late Gemini gemini;

  Future<void> initialize() async {
    try {
      final storedGeminiApiKey = await readSecureData(Constants.geminiApiKey);

      if (storedGeminiApiKey == null) {
        const apiKeyFromAppKeys = AppKeys.geminiApiKey;
        if (apiKeyFromAppKeys.isNotEmpty) {
          await writeSecureData(Constants.geminiApiKey, apiKeyFromAppKeys);
          Gemini.init(apiKey: apiKeyFromAppKeys);
          gemini = Gemini.instance;
        } else {
          throw Exception('Gemini API key not found in AppKeys');
        }
      } else {
        Gemini.init(apiKey: storedGeminiApiKey);
        gemini = Gemini.instance;
       
      }
    } catch (e) {
      throw Exception('Failed to initialize Gemini: $e');
    }
  }
  
}


