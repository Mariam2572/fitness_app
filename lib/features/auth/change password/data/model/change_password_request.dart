import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  String? password;
  String? newPassword;

  ChangePasswordRequest({this.password, this.newPassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  ChangePasswordRequest copyWith({String? password, String? newPassword}) {
    return ChangePasswordRequest(
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
