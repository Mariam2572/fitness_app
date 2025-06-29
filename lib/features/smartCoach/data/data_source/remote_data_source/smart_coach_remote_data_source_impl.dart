import 'package:fitness_app/core/utils/services/gemini_service.dart';
import 'package:fitness_app/features/smartCoach/data/data_source/remote_data_source/smart_coach_remote_data_source.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachRemoteDataSource)
class SmartCoachRemoteDataSourceImpl implements SmartCoachRemoteDataSource {
  final GeminiService geminiService;

  SmartCoachRemoteDataSourceImpl({required this.geminiService});
  @override
  Future<String> sendPromptToAI({required String promp}) async {
    final buffer = StringBuffer();
    final response = geminiService.gemini.promptStream(
      parts: [Part.text(promp)],
    );
    await for (final message in response) {
      buffer.write(message?.output);
    }
    return buffer.toString().isEmpty ? "No Response" : buffer.toString();
  }
}
