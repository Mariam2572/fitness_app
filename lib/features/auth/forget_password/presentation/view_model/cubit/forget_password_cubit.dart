import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/verify_reset_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/verify_reset_response.dart';
import 'package:fitness_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:fitness_app/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:fitness_app/features/auth/forget_password/domain/use_cases/verify_reset_use_case.dart';
import 'package:flutter/material.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetUseCase verifyResetUseCase;
  ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordCubit(
    this.forgetPasswordUseCase,
    this.verifyResetUseCase,
    this.resetPasswordUseCase,
  ) : super(ForgetPasswordInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController resetCodeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailController.dispose();
    resetCodeController.dispose();
    newPasswordController.dispose();
    return super.close();
  }

  Future<void> _forgetPassword({bool? isResend}) async {
    emit(ForgetPasswordLoading());

    final result = await forgetPasswordUseCase.invoke(
      ForgetPasswordRequest(email: emailController.text),
    );

    if (result is ApiSuccess<ForgetPasswordResponse>) {
      if (isResend == true) {
        emit(ResendCodeState()); // ONLY emit special state AFTER success
      } else {
        emit(ForgetPasswordSuccess(data: result.data!));
      }
    } else if (result is ApiError<ForgetPasswordResponse>) {
      emit(
        ForgetPasswordError(
          errorMessage: result.message ?? "",
          failureMessage: result.failure?.errorMessage ?? "",
        ),
      );
      log('${result.message} error message');
    }
  }

  Future<void> _verifyReset() async {
    emit(VerifyResetLoading());

    final result = await verifyResetUseCase.invoke(
      VerifyResetRequest(resetCode: resetCodeController.text),
    );

    if (result is ApiSuccess<VerifyResetResponse>) {
      emit(VerifyResetSuccess(data: result.data!));
    } else if (result is ApiError<VerifyResetResponse>) {
      emit(
        VerifyResetError(
          errorMessage: result.message ?? "",
          failureMessage: result.failure?.errorMessage ?? "",
        ),
      );
      log('${result.message} error message');
    }
  }

  Future<void> _resetPassword() async {
    emit(ResetPasswordLoading());

    final result = await resetPasswordUseCase.invoke(
      ResetPasswordRequest(
        newPassword: newPasswordController.text,
        email: emailController.text,
      ),
    );

    if (result is ApiSuccess<ResetPasswordResponse>) {
      emit(ResetPasswordSuccess(data: result.data!));
    } else if (result is ApiError<ResetPasswordResponse>) {
      log(result.message??'');
      log(result.failure!.errorMessage);
      log("Ssss");
      emit(
        ResetPasswordError(
          errorMessage: result.message ?? "",
          failureMessage: result.failure?.errorMessage ?? "",
        ),
      );
      log('${result.message} error message');
    }
  }

  void doIntent(AuthIntent authIntent) {
    switch (authIntent) {
      case ForgetPasswordIntent():
        {
          final intent = authIntent;
          _forgetPassword(isResend: intent.isResend);
        }
      case VerifyResetIntent():
        {
          _verifyReset();
        }
      case ResetPasswordIntent():
        {
          _resetPassword();
        }
    }
  }
}

sealed class AuthIntent {}

class ForgetPasswordIntent extends AuthIntent {
  final bool? isResend;

  ForgetPasswordIntent({this.isResend});
}

class VerifyResetIntent extends AuthIntent {}

class ResetPasswordIntent extends AuthIntent {}
