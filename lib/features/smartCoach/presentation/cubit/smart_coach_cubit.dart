// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fitness_app/features/smartCoach/domain/use_case/send_message_use_case.dart';

part 'smart_coach_state.dart';

class SmartCoachCubit extends Cubit<SmartCoachState> {
  final SendMessageUseCase _sendMessageUseCase;
  SmartCoachCubit(this._sendMessageUseCase) : super(SmartCoachInitial());
  doIntent(SmartCoachIntent intent) {
    switch (intent) {
      case GetSmartCoachIntent():
        _sendMessage(intent.prompt);
        break;
    }
  }

  _sendMessage(String prompt) async {
    emit(SmartCoachLoading());
    try {
      final response = await _sendMessageUseCase(prompt);
      emit(SmartCoachSuccess(response: response));
    } catch (e) {
      emit(SmartCoachFailure(message: e.toString()));
    }
  }
}

sealed class SmartCoachIntent {}

class GetSmartCoachIntent extends SmartCoachIntent {
  final String prompt;
  GetSmartCoachIntent({required this.prompt});
}
