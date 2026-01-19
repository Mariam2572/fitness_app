import 'package:fitness_app/features/smartCoach/data/models/conversation_hive_model.dart';

abstract interface class ChatHistoryService {
  Future<void> init();

  Future<void> saveConversation(ConversationHiveModel conversation);

  Future<List<ConversationHiveModel>> getUserConversations(String userId);

  Future<ConversationHiveModel?> getConversation(
    String conversationId,
    String userId,
  );

  Future<void> deleteConversation(String conversationId, String userId);

  Future<void> clearUserHistory(String userId);
}