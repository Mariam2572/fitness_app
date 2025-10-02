
import 'package:fitness_app/features/smartCoach/data/data_source/local/conversation_local_datasource.dart';
import 'package:fitness_app/features/smartCoach/data/models/message_model.dart';
import 'package:fitness_app/features/smartCoach/data/models/ConversationHiveModel.dart';
import 'package:fitness_app/features/smartCoach/data/models/ConversationModel.dart';
import 'package:fitness_app/features/smartCoach/domain/repo/ConversationRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ConversationRepository)
class ConversationRepositoryImpl implements ConversationRepository {
  final ConversationLocalDataSource localDataSource;

  ConversationRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveConversation(ConversationModel conversation) async {
    final hiveModel = ConversationHiveModel(
      messages: conversation.messages.map((e)=>e.toHiveModel()).toList(),
      timestamp: conversation.timestamp,
    );
    await localDataSource.saveConversation(hiveModel);
  }

  @override
  @override
  Future<List<ConversationModel>> getAllConversations() async {
    final list = await localDataSource.getAllConversations();

    return list.map(
          (e) =>
          ConversationModel(
            messages: e.messages.map((msg) => msg.toNormalModel()).toList(),
            timestamp: e.timestamp,
          ),
    ).toList();
  }
  }
