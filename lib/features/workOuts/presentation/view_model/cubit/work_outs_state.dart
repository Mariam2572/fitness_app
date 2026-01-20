part of 'work_outs_cubit.dart';

sealed class WorkOutsState extends Equatable {
  const WorkOutsState();

  @override
  List<Object> get props => [];
}

final class WorkOutsInitial extends WorkOutsState {}

final class WorkOutsLoading extends WorkOutsState {}

final class WorkOutsSuccess extends WorkOutsState {
  final GetAllMusclesGroupsReponse response;
  const WorkOutsSuccess(this.response);
  @override
  List<Object> get props => [response];
}

final class WorkOutsFailure extends WorkOutsState {
  final String error;
  const WorkOutsFailure(this.error);
  @override
  List<Object> get props => [error];
}

final class WorkOutsByIdInitial extends WorkOutsState {}

final class WorkOutsByIdLoading extends WorkOutsState {}

final class WorkOutsByIdSuccess extends WorkOutsState {
  final GetAllMusclesByMuscleGroupIdReponse response;
  const WorkOutsByIdSuccess(this.response);
  @override
  List<Object> get props => [response];
}

final class WorkOutsByIdFailure extends WorkOutsState {
  final String error;
  const WorkOutsByIdFailure(this.error);
  @override
  List<Object> get props => [error];
}
