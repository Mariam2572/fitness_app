// presentation/view_model/change_password_state.dart
import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object?> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordResponse response;

  const ChangePasswordSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class ChangePasswordFailure extends ChangePasswordState {
  final String message;

  const ChangePasswordFailure(this.message);

  @override
  List<Object?> get props => [message];
}
