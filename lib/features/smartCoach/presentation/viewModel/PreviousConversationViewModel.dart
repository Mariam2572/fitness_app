import 'dart:async';
import 'dart:developer';

import 'package:fitness_app/features/smartCoach/data/models/message_model.dart';
import 'package:fitness_app/features/smartCoach/data/models/ConversationModel.dart';
import 'package:fitness_app/features/smartCoach/domain/use_case/get_previous_conversations_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'previous_conversation_state.dart';

@injectable
class PreviousConversationViewModel extends Cubit<PreviousConversationState> {
  final GetPreviousConversationsUseCase useCase;

  // Stream controller for conversation selection
  final StreamController<List<ChatMessage>> _conversationSelectedController =
  StreamController<List<ChatMessage>>.broadcast();

  Stream<List<ChatMessage>>? get conversationSelectedStream =>
      _conversationSelectedController.stream;

  PreviousConversationViewModel(this.useCase) : super(InitialState());

  void onIntent(PreviousConversationIntent intent) {
    if (intent is LoadPreviousConversations) {
      load();
    }
  }

  Future<List<ConversationModel>> load() async {
    emit(LoadingState());

    try {
      final result = await useCase.getAllConversation();
      emit(LoadedState(result));
      return result;
    } catch (e) {
      emit(ErrorState(e.toString()));
      return [];
    }
  }

  Future<void> saveNewConversation(ConversationModel conversation) async {
    log('Attempting to save conversation with ${conversation.messages.length} messages');
    await useCase.saveConversation(conversation);
  }

  // Method to notify about conversation selection
  void selectConversation(List<ChatMessage> messages) {
    log('Conversation selected with ${messages.length} messages');
    _conversationSelectedController.add(messages);
  }

  @override
  Future<void> close() {
    _conversationSelectedController.close();
    return super.close();
  }
}

abstract class PreviousConversationIntent {}

class LoadPreviousConversations extends PreviousConversationIntent {}