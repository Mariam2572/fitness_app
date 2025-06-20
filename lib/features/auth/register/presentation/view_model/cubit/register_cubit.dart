import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(RegisterInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  int height = 0;
  int weight = 0;
  int age = 15;
  String? goal;
  String? activityLevel;
  static Gender selectedGender = Gender.female;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void doIntent(RegisterIntent intent) {
    switch (intent) {
      case RegisterUserIntent():
        _register(intent);
        break;
    }
  }

  Future<void> _register(RegisterUserIntent intent) async {
      emit(RegisterLoading());
      final response = await _registerUseCase.invoke(intent.request);
      switch (response) {
        case ApiError<RegisterResponse>():
          emit(
            RegisterFailure(
              response.failure?.errorMessage ?? 'An error occurred',
            ),
          );
        case ApiSuccess<RegisterResponse>():
          emit(RegisterSuccess(response.data!));
        default:
          emit(const RegisterFailure('Unexpected error occurred'));
          break;
      }
    
  }

  dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.close();
  }
}

sealed class RegisterIntent {}

class RegisterUserIntent extends RegisterIntent {
  RegisterRequest request;
  RegisterUserIntent({required this.request});
}
