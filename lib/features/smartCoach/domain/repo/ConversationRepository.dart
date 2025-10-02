
import 'package:fitness_app/features/smartCoach/data/models/ConversationModel.dart';

abstract class ConversationRepository {

  Future<void> saveConversation(ConversationModel conversation);
  Future<List<ConversationModel>> getAllConversations();

}
