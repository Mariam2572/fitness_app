import 'package:fitness_app/features/smartCoach/data/models/ChatMessageHiveModel.dart';
import 'package:hive/hive.dart';

part 'ConversationHiveModel.g.dart';

@HiveType(typeId: 0)
class ConversationHiveModel extends HiveObject {
  @HiveField(0)
  final List<ChatMessageHiveModel> messages;
  @HiveField(1)
  final DateTime timestamp;

  ConversationHiveModel({
    required this.messages,
    required this.timestamp,
  });
}
