part of 'smart_coach_cubit.dart';

sealed class SmartCoachState extends Equatable {
  const SmartCoachState();

  @override
  List<Object> get props => [];
}

final class SmartCoachInitial extends SmartCoachState {}
final class SmartCoachLoading extends SmartCoachState {}
final class SmartCoachSuccess extends SmartCoachState {
    final String response;
  const SmartCoachSuccess({required this.response});
}
final class SmartCoachFailure extends SmartCoachState {
  final String message;
  const SmartCoachFailure({required this.message});
}