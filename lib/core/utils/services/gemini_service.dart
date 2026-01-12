import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/app_keys.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@singleton
class GeminiService {
  late Gemini gemini;
  bool _isInitialized = false;

  Future<void> initialize() async {
    // Only initialize once, or reinitialize if needed
    if (_isInitialized && !_isGeminiEmpty()) {
      return;
    }

    try {
      final apiKeyFromAppKeys = AppKeys.geminiApiKey;

      if (apiKeyFromAppKeys.isEmpty) {
        throw Exception('Gemini API key not found in AppKeys');
      }

      // Always use the API key from AppKeys (it's the source of truth)
      // This ensures that when you update the key, it will be used immediately
      await writeSecureData(Constants.geminiApiKey, apiKeyFromAppKeys);

      Gemini.init(apiKey: apiKeyFromAppKeys);
      gemini = Gemini.instance;
      _isInitialized = true;
    } catch (e) {
      _isInitialized = false;
      throw Exception('Failed to initialize Gemini: $e');
    }
  }

  /// Check if Gemini instance is properly initialized
  bool _isGeminiEmpty() {
    try {
      // Try to access the Gemini instance
      gemini = Gemini.instance;
      return false;
    } catch (e) {
      return true;
    }
  }

  /// Force reinitialize Gemini (useful for debugging or recovery)
  Future<void> reinitialize() async {
    _isInitialized = false;
    await initialize();
  }
}
