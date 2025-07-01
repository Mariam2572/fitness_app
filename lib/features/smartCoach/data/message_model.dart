import 'package:fitness_app/features/smartCoach/data/models/ChatMessageHiveModel.dart';

class ChatMessage {
  final String role; 
  final String text;

  ChatMessage({required this.role, required this.text});
}
extension ChatMessageMapper on ChatMessage {
  ChatMessageHiveModel toHiveModel() =>
      ChatMessageHiveModel(role: role, text: text);
}

extension ChatMessageHiveMapper on ChatMessageHiveModel {
  ChatMessage toNormalModel() => ChatMessage(role: role, text: text);
}