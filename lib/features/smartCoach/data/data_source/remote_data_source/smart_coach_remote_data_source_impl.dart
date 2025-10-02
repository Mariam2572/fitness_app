import 'package:fitness_app/core/utils/services/gemini_service.dart';
import 'package:fitness_app/features/smartCoach/data/data_source/remote_data_source/smart_coach_remote_data_source.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachRemoteDataSource)
class SmartCoachRemoteDataSourceImpl implements SmartCoachRemoteDataSource {
  final GeminiService geminiService;

  SmartCoachRemoteDataSourceImpl({required this.geminiService});
 static const String _instructions = """
Please answer the following question in the same language it's written. Only respond if the question is related to fitness or gym topics.

If the question is not related to fitness or gym, politely respond that you can only answer questions in the fitness domain.

""";
  @override
  Future<String> sendPromptToAI(
    String userMessage, {
    String? userContext,
  }) async {
    final buffer = StringBuffer();
    try {
      String fullPrompt = _instructions;

      

      fullPrompt += '\n\nUser: $userMessage\n\nFitCoach AI:';

      final response = geminiService.gemini.promptStream(
        parts: [Part.text(fullPrompt)],
      );
      await for (final message in response) {
        buffer.write(message?.output);
      }
      return buffer.toString().isEmpty ? "No Response" : buffer.toString();
    } catch (e) {
      throw Exception('Failed to get coach response: $e');
    }
  }

 
}
