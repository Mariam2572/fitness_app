import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/models/user_response.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data_use_case.dart';
import 'package:fitness_app/features/smartCoach/data/models/conversation_hive_model.dart';
import 'package:fitness_app/features/smartCoach/data/models/message_model.dart';
import 'package:fitness_app/features/smartCoach/data/repo/chat_history_repo.dart';
import 'package:fitness_app/features/smartCoach/domain/use_case/send_message_use_case.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_intent.dart';
import 'package:injectable/injectable.dart'; // For @injectable if needed, but usually Cubit isn't annotated if manual injection, but here user said 'Update SmartCoachCubit constructor to inject all three dependencies', assuming get_it setup elsewhere.
import 'package:uuid/uuid.dart';

part 'smart_coach_state.dart';

@injectable
class SmartCoachCubit extends Cubit<SmartCoachState> {
  final SendMessageUseCase _sendMessageUseCase;
  final ChatHistoryService _chatHistoryService;
  final GetProfileDataUseCase _getProfileDataUseCase;

  SmartCoachCubit(
    this._sendMessageUseCase,
    this._chatHistoryService,
    this._getProfileDataUseCase,
  ) : super(const SmartCoachState());

  void doIntent(SmartCoachIntent intent) {
    switch (intent) {
      case GetSmartCoachIntent():
        sendMessage(intent.prompt);
        break;
      case LoadConversationsIntent():
        loadConversations();
        break;
      case SaveConversationIntent():
        // Auto-save is implemented in sendMessage, but manual save could be here
        break;
      case DeleteConversationIntent():
        deleteConversation(intent.conversationId);
        break;
    }
  }

  /// Initialize the chat session. Call this when entering the screen.
  Future<void> initialize({
    String? conversationId,
    List<ChatMessage>? initialMessages,
  }) async {
    emit(state.copyWith(status: SmartCoachStatus.loading));

    // 1. Fetch User Profile
    String userId = "unknown_user";
    try {
      final result = await _getProfileDataUseCase();

      if (result is ApiSuccess<UserResponse>) {
        // Assuming ApiSuccess has generic T, here UserResponse
        final fetchedId = result.data?.user?.id;
        if (fetchedId != null) {
          userId = fetchedId;
          emit(
            state.copyWith(status: SmartCoachStatus.initial, userId: userId),
          );
          log("User profile fetched: $userId");
        } else {
          log("User profile fetched but ID is null");
        }
      } else if (result is ApiError<UserResponse>) {
        emit(
          state.copyWith(
            status: SmartCoachStatus.failure,
            errorMessage: result.message,
          ),
        );
        log("User profile fetch failed: ${result.message}");
      }
    } catch (e) {
      log("User profile fetch exception: $e");
    }

    final currentId = conversationId ?? const Uuid().v4();

    // 2. Initialize Service matches logic
    try {
      await _chatHistoryService.init();
      log("ChatHistoryService initialized");
    } catch (e) {
      log("ChatHistoryService init failed: $e");
      emit(
        state.copyWith(
          status: SmartCoachStatus.failure,
          errorMessage: "Failed to initialize storage",
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        userId: userId,
        currentConversationId: currentId,
        messages: initialMessages ?? [],
        status: SmartCoachStatus.initial,
      ),
    );

    // Load history for the drawer
    await loadConversations();
  }

  Future<void> startNewConversation() async {
    emit(
      state.copyWith(
        currentConversationId: const Uuid().v4(),
        messages: [],
        status: SmartCoachStatus.initial,
        isNewMessage: false,
      ),
    );
  }

  Future<void> loadConversations() async {
    if (state.userId == null) return;

    emit(state.copyWith(isHistoryLoading: true));
    try {
      final conversations = await _chatHistoryService.getUserConversations(
        state.userId!,
      );
      emit(
        state.copyWith(conversations: conversations, isHistoryLoading: false),
      );
    } catch (e) {
      emit(state.copyWith(isHistoryLoading: false));
    }
  }

  /// Gets the current user's name from the profile data
  /// Returns 'User' as a fallback if the name is not available
  Future<String> getCurrentUserData() async {
    try {
      final result = await _getProfileDataUseCase();
      if (result is ApiSuccess<UserResponse>) {
        emit(
          state.copyWith(
            status: SmartCoachStatus.success,
            userName: result.data?.user?.firstName ?? 'User',
          ),
        );
        return result.data?.user?.firstName ?? 'User';
      }
    } catch (e) {
      log("Error getting user data: $e");
    }
    return 'User';
  }

  Future<void> loadConversation(String conversationId) async {
    if (state.userId == null) return;

    final conversation = await _chatHistoryService.getConversation(
      conversationId,
      state.userId!,
    );
    if (conversation != null) {
      // Convert Hive messages to UI messages
      final uiMessages =
          conversation.messages.map((m) => m.toChatMessage()).toList();
      emit(
        state.copyWith(
          currentConversationId: conversationId,
          messages: uiMessages,
          status:
              SmartCoachStatus
                  .initial, // Reset status to allow sending new messages
          isNewMessage: false, // Don't animate cached messages
        ),
      );
    }
  }

  Future<void> deleteConversation(String conversationId) async {
    if (state.userId == null) return;

    await _chatHistoryService.deleteConversation(conversationId, state.userId!);
    await loadConversations(); // Reload list

    // If deleted current conversation, start new one
    if (state.currentConversationId == conversationId) {
      startNewConversation();
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    if (state.userId == null) return;
    log("user ${state.userId} sendMessage: $text");

    final userMsg = ChatMessage(role: 'user', text: text);
    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(userMsg);

    emit(
      state.copyWith(
        messages: updatedMessages,
        isTyping: true,
        status: SmartCoachStatus.loading,
        isNewMessage: false,
      ),
    );

    try {
      final responseText = await _sendMessageUseCase(text);

      final aiMsg = ChatMessage(role: 'ai', text: responseText);
      final finalMessages = List<ChatMessage>.from(state.messages)..add(aiMsg);

      emit(
        state.copyWith(
          messages: finalMessages,
          isTyping: false,
          status: SmartCoachStatus.success,
          isNewMessage: true,
        ),
      );

      // Save to Hive
      await _saveToHistory(finalMessages);
      await loadConversations(); // Refresh drawer list
    } catch (e) {
      emit(
        state.copyWith(
          isTyping: false,
          status: SmartCoachStatus.failure,
          errorMessage: e.toString(),
          isNewMessage: false,
        ),
      );
    }
  }

  Future<void> _saveToHistory(List<ChatMessage> messages) async {
    if (state.currentConversationId == null || state.userId == null) return;

    // Convert UI messages to Hive messages
    final hiveMessages =
        messages.map((m) => ChatMessageHiveModel.fromChatMessage(m)).toList();

    // Check if updating existing to preserve createdAt
    final existing = await _chatHistoryService.getConversation(
      state.currentConversationId!,
      state.userId!,
    );

    final createdAt = existing?.createdAt ?? DateTime.now();
    final title =
        existing?.title ??
        (messages.isNotEmpty
            ? (messages.first.text.length > 30
                ? '${messages.first.text.substring(0, 30)}...'
                : messages.first.text)
            : 'New Conversation');

    final conversation = ConversationHiveModel(
      conversationId: state.currentConversationId!,
      userId: state.userId!,
      messages: hiveMessages,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      title: title,
    );

    await _chatHistoryService.saveConversation(conversation);
  }
}
