import 'package:hive/hive.dart';

part 'ChatMessageHiveModel.g.dart';

@HiveType(typeId: 1)
class ChatMessageHiveModel extends HiveObject {
  @HiveField(0)
  late String role;

  @HiveField(1)
  late String text;

  ChatMessageHiveModel({required this.role, required this.text});
}
