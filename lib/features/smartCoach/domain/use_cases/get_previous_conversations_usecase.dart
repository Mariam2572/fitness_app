
import 'package:fitness_app/features/smartCoach/data/models/ConversationModel.dart';
import 'package:fitness_app/features/smartCoach/domain/repositories/ConversationRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPreviousConversationsUseCase {
  final ConversationRepository repository;

  GetPreviousConversationsUseCase(this.repository);

  Future<List<ConversationModel>> getAllConversation() {
    return repository.getAllConversations();
  }


  Future<void> saveConversation(ConversationModel conversation) => repository.saveConversation(conversation);

}
