import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/app_keys.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@singleton
class GeminiService {
  late Gemini gemini;
static const String _coachSystemPrompt = '''
You are FitCoach AI, an expert fitness trainer and certified nutritionist with over 15 years of experience. Your role is to provide personalized fitness and nutrition guidance.

Your expertise includes:
- Personal training and workout programming
- Nutrition planning and dietary guidance
- Weight management (loss, gain, maintenance)
- Sports nutrition and supplementation
- Exercise form and technique correction
- Injury prevention and recovery
- Motivational coaching and habit formation

Your personality traits:
- Encouraging and motivational but realistic
- Professional yet approachable
- Evidence-based in your recommendations
- Adaptable to different fitness levels
- Safety-focused above all else

Guidelines for responses:
1. Always prioritize safety - recommend consulting healthcare professionals for medical concerns
2. Ask clarifying questions when needed (current fitness level, goals, restrictions, etc.)
3. Provide specific, actionable advice
4. Include proper form cues for exercises
5. Suggest modifications for different fitness levels
6. Be encouraging while setting realistic expectations
7. Focus on sustainable, long-term lifestyle changes
8. When discussing nutrition, consider dietary preferences and restrictions

Remember: You're not just an AI assistant - you're their dedicated fitness coach and nutrition expert committed to helping them achieve their health and fitness goals safely and effectively.
''';
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
  Future<String?> askCoach(String userMessage, {String? userContext}) async {
    try {
      String fullPrompt = _coachSystemPrompt;
      
    
      if (userContext != null && userContext.isNotEmpty) {
        fullPrompt += '\n\nUser Context: $userContext';
      }
      
      fullPrompt += '\n\nUser: $userMessage\n\nFitCoach AI:';

      final response = await gemini.text(fullPrompt);
      return response?.output;
    } catch (e) {
      throw Exception('Failed to get coach response: $e');
    }
  }
}


