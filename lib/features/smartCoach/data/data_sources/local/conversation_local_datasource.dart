
import 'package:fitness_app/features/smartCoach/data/models/ConversationHiveModel.dart';

abstract class ConversationLocalDataSource {
  Future<void> saveConversation(ConversationHiveModel conversation);
  Future<List<ConversationHiveModel>> getAllConversations();
}