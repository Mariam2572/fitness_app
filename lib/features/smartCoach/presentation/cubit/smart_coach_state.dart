part of 'smart_coach_cubit.dart';

enum SmartCoachStatus { initial, loading, success, failure }

class SmartCoachState extends Equatable {
  final SmartCoachStatus status;
  final List<ChatMessage> messages;
  final List<ConversationHiveModel> conversations;
  final bool isTyping;
  final bool isHistoryLoading;
  final String? currentConversationId;
  final String? userId;
  final String? userName;
  final String? errorMessage;
  final bool isNewMessage;

  const SmartCoachState({
    this.status = SmartCoachStatus.initial,
    this.messages = const [],
    this.conversations = const [],
    this.isTyping = false,
    this.isHistoryLoading = false,
    this.currentConversationId,
    this.userId,
    this.userName,
    this.errorMessage,
    this.isNewMessage = false,
  });

  SmartCoachState copyWith({
    SmartCoachStatus? status,
    List<ChatMessage>? messages,
    List<ConversationHiveModel>? conversations,
    bool? isTyping,
    bool? isHistoryLoading,
    String? currentConversationId,
    String? userId,
    String? userName,
    String? errorMessage,
    bool? isNewMessage,
  }) {
    return SmartCoachState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      conversations: conversations ?? this.conversations,
      isTyping: isTyping ?? this.isTyping,
      isHistoryLoading: isHistoryLoading ?? this.isHistoryLoading,
      currentConversationId:
          currentConversationId ?? this.currentConversationId,
      userId: userId ?? this.userId,
        userName: userId?? this.userName,
      errorMessage: errorMessage ?? this.errorMessage,
      isNewMessage: isNewMessage ?? this.isNewMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    messages,
    conversations,
    isTyping,
    isHistoryLoading,
    currentConversationId,
    userId,
    userName,
    errorMessage,
    isNewMessage,
  ];
}
