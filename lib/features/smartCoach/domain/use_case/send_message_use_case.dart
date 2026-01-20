import 'package:fitness_app/features/smartCoach/domain/repos/smart_coach_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendMessageUseCase {
  final SmartCoachRepo smartCoachRepo;
  SendMessageUseCase(this.smartCoachRepo);
  Future<String> call(String message) async => await smartCoachRepo.sendMessage(message);
}
