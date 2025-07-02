import 'package:fitness_app/features/smartCoach/data/message_model.dart';

class ConversationModel {
  List<ChatMessage> messages;
  final DateTime timestamp;

  ConversationModel({
    required this.messages,
    required this.timestamp,
  });
}
