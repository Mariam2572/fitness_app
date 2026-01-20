
import 'package:fitness_app/features/smartCoach/data/models/message_model.dart';

sealed class SmartCoachIntent {}

class GetSmartCoachIntent extends SmartCoachIntent {
  final String prompt;
  GetSmartCoachIntent({required this.prompt});
}

class LoadConversationsIntent extends SmartCoachIntent {}

class SaveConversationIntent extends SmartCoachIntent {
  final String conversationId;
  final String userId;
  final List<ChatMessage> messages;
  final String? title;

  SaveConversationIntent({
    required this.conversationId,
    required this.userId,
    required this.messages,
    this.title,
  });
}

class DeleteConversationIntent extends SmartCoachIntent {
  final String conversationId;
  DeleteConversationIntent(this.conversationId);
}
