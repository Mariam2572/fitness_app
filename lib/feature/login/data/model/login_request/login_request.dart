import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  LoginRequest copyWith({String? email, String? password}) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
