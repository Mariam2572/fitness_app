// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/core/base/api_result.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginUsecase loginUseCase;

  Future<void> doIntent(LoginIntent intent) async {
    if (intent is PerformLogin) {
      await _handleLogin(intent);
    }
  }

  Future<void> _handleLogin(PerformLogin intent) async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    emit(LoginLoading());
    final response = await loginUseCase.invoke(loginRequest: intent.request);
    switch (response) {
      case ApiError<LoginResponse>():
        emit(
          LoginFailure(response.failure?.errorMessage ?? 'An error occurred'),
        );
      case ApiSuccess<LoginResponse>():
        emit(LoginSuccess(response.data!));
    }
  }
}

sealed class LoginIntent {}

class PerformLogin extends LoginIntent {
  LoginRequest request;

  PerformLogin({required this.request});
}
