import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:fitness_app/features/auth/login/data/model/login_response/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  User? user;
  String? token;

  LoginResponse({this.message, this.user, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginResponse copyWith({String? message, User? user, String? token}) {
    return LoginResponse(
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;
}
