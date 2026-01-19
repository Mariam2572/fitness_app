part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordResponse data;
  const ForgetPasswordSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

final class ForgetPasswordError extends ForgetPasswordState {
  final String errorMessage;
  final String failureMessage;

  const ForgetPasswordError({
    required this.errorMessage,
    required this.failureMessage,
  });
  @override
  List<Object> get props => [errorMessage, failureMessage];
}

final class VerifyResetInitial extends ForgetPasswordState {}

final class VerifyResetLoading extends ForgetPasswordState {}

final class VerifyResetSuccess extends ForgetPasswordState {
  final VerifyResetResponse data;
  const VerifyResetSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

final class VerifyResetError extends ForgetPasswordState {
  final String errorMessage;
  final String failureMessage;

  const VerifyResetError({
    required this.errorMessage,
    required this.failureMessage,
  });
  @override
  List<Object> get props => [errorMessage, failureMessage];
}

final class ResetPasswordInitial extends ForgetPasswordState {}

final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPasswordSuccess extends ForgetPasswordState {
  final ResetPasswordResponse data;
  const ResetPasswordSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

final class ResetPasswordError extends ForgetPasswordState {
  final String errorMessage;
  final String failureMessage;

  const ResetPasswordError({
    required this.errorMessage,
    required this.failureMessage,
  });
  @override
  List<Object> get props => [errorMessage, failureMessage];
}

final class NavigateState extends ForgetPasswordState {
  final String routeName;

  const NavigateState(this.routeName);

  @override
  List<Object> get props => [routeName];
}

final class ResendCodeState extends ForgetPasswordState {}
