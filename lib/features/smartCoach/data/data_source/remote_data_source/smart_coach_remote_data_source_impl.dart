import 'package:fitness_app/core/utils/services/gemini_service.dart';
import 'package:fitness_app/features/smartCoach/domain/repos/smart_coach_remote_data_source.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachRemoteDataSource)
class SmartCoachRemoteDataSourceImpl implements SmartCoachRemoteDataSource {
  final GeminiService geminiService;

  SmartCoachRemoteDataSourceImpl({required this.geminiService});
  
  @override
  Future<String> sendPromptToAI({required String promp}) async {
    try {
      // Ensure the service is initialized before making the request
      await geminiService.initialize();
      
      // Validate the prompt
      if (promp.isEmpty) {
        throw Exception('Prompt cannot be empty');
      }
      
      final buffer = StringBuffer();
      final response = geminiService.gemini.promptStream(
        parts: [Part.text(promp)],
      );
      
      await for (final message in response) {
        if (message?.output != null) {
          buffer.write(message!.output);
        }
      }
      
      final result = buffer.toString().trim();
      return result.isEmpty ? "No Response" : result;
    } catch (e) {
      // Re-throw with more context for debugging
      throw Exception('Failed to get AI response: ${e.toString()}');
    }
  }


}

  
