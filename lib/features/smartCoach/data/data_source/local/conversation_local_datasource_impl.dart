import 'package:fitness_app/features/smartCoach/data/data_source/local/conversation_local_datasource.dart';
import 'package:fitness_app/features/smartCoach/data/models/ConversationHiveModel.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ConversationLocalDataSource)
class ConversationLocalDataSourceImpl implements ConversationLocalDataSource {
  final Box<ConversationHiveModel> box;

  ConversationLocalDataSourceImpl(this.box);

  @override
  Future<void> saveConversation(ConversationHiveModel conversation) async {
    await box.add(conversation);
  }

  @override
  Future<List<ConversationHiveModel>> getAllConversations() async {
    return box.values.toList();
  }
}