
import 'package:fitness_app/features/smartCoach/data/models/ConversationModel.dart';

abstract class PreviousConversationState {}

class InitialState extends PreviousConversationState {}

class LoadingState extends PreviousConversationState {}

class LoadedState extends PreviousConversationState {
  final List<ConversationModel> conversations;
  LoadedState(this.conversations);
}

class ErrorState extends PreviousConversationState {
  final String message;
  ErrorState(this.message);
}
