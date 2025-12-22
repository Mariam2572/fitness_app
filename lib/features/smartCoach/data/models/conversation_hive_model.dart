import 'package:fitness_app/features/smartCoach/data/models/message_model.dart';
import 'package:hive/hive.dart';

part 'conversation_hive_model.g.dart';

@HiveType(typeId: 0)
class ConversationHiveModel extends HiveObject {
  @HiveField(0)
  final String conversationId;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final List<ChatMessageHiveModel> messages;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  final DateTime updatedAt;

  @HiveField(5)
  final String? title;

  ConversationHiveModel({
    required this.conversationId,
    required this.userId,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    this.title,
  });
}

@HiveType(typeId: 1)
class ChatMessageHiveModel extends HiveObject {
  @HiveField(0)
  final String role;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final DateTime timestamp;

  ChatMessageHiveModel({
    required this.role,
    required this.text,
    required this.timestamp,
  });

  factory ChatMessageHiveModel.fromChatMessage(ChatMessage message) {
    return ChatMessageHiveModel(
      role: message.role,
      text: message.text,
      timestamp: DateTime.now(),
    );
  }

  ChatMessage toChatMessage() {
    return ChatMessage(role: role, text: text);
  }
}
