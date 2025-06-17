import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/feature/login/data/model/login_request.dart';
import 'package:fitness_app/feature/login/data/model/login_response.dart';
import 'package:fitness_app/feature/login/domain/usecases/login_usecase.dart';
import 'package:fitness_app/feature/login/presentation/view_model/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginState());

  final LoginUsecase loginUseCase;

  Future<void> doIntent(LoginIntent intent) async {
    if (intent is PerformLogin) {
      await _handleLogin(intent);
    }
  }

  Future<void> _handleLogin(PerformLogin intent) async {
    emit(state.copyWith(loginState: BaseLoading()));

    final result = await loginUseCase.invoke(
      loginRequest: LoginRequest(
        email: intent.email,
        password: intent.password,
      ),
    );

    switch (result) {
      case ApiSuccess<LoginResponse>():
        emit(
          state.copyWith(
            loginState: BaseSuccess<LoginResponse>(data: result.data),
          ),
        );
        break;

      case ApiError<LoginResponse>():
        emit(
          state.copyWith(
            loginState: BaseError<LoginResponse>(
              errorMessage:
                  result.failure?.errorMessage ?? "Something went wrong",
            ),
          ),
        );
        break;
    }
  }
}

abstract class LoginIntent {}

class PerformLogin extends LoginIntent {
  final String email;
  final String password;

  PerformLogin({required this.email, required this.password});
}
