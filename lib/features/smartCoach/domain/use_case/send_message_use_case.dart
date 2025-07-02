import 'package:fitness_app/features/smartCoach/domain/repo/smart_coach_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendMessageUseCase {
  final SmartCoachRepo smartCoachRepo;
  SendMessageUseCase(this.smartCoachRepo);
  Future<String> call(String message) => smartCoachRepo.sendMessage(message);
}