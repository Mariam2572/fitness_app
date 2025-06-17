// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/feature/login/data/model/login_response.dart';

class LoginState extends Equatable {
  final BaseState<LoginResponse>? loginState;
  LoginResponse? loginResponse;
  LoginState({this.loginState, this.loginResponse});
  LoginState copyWith({
    BaseState<LoginResponse>? loginState,
    LoginResponse? loginResponse,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  List<Object?> get props => [loginState, loginResponse];
}
