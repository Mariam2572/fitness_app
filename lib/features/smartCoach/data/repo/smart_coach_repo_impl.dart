import 'package:fitness_app/features/smartCoach/domain/repo/smart_coach_remote_data_source.dart';
import 'package:fitness_app/features/smartCoach/domain/repo/smart_coach_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartCoachRepo)
class SmartCoachRepoImpl implements SmartCoachRepo {
  final SmartCoachRemoteDataSource remoteDataSource;

  SmartCoachRepoImpl({required this.remoteDataSource});

  @override
  Future<String> sendMessage(String message) async {
    return await remoteDataSource.sendPromptToAI(promp: message);
  }
}
