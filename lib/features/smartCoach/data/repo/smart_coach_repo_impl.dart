import 'dart:developer';
import 'package:fitness_app/features/smartCoach/domain/repos/smart_coach_remote_data_source.dart';
import 'package:fitness_app/features/smartCoach/domain/repos/smart_coach_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachRepo)
class SmartCoachRepoImpl implements SmartCoachRepo {
  final SmartCoachRemoteDataSource remoteDataSource;

  SmartCoachRepoImpl({required this.remoteDataSource});

  @override
  Future<String> sendMessage(String message) async {
    try {
      return await remoteDataSource.sendPromptToAI(promp: message);
    } catch (e) {
      _logError('sendMessage', e);
      if (e.toString().contains('403') || e.toString().contains('Forbidden')) {
        throw Exception(
          'API Authorization Error (403): Your API key may be invalid, expired, or lack the necessary permissions. '
          'Please verify your Gemini API key and ensure it has the required scopes enabled.',
        );
      }
      rethrow;
    }
  }

  void _logError(String method, dynamic error) {
    log('SmartCoachRepoImpl.$method - Error: $error');
  }
}
