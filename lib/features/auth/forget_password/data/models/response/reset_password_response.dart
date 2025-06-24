import 'package:json_annotation/json_annotation.dart';
part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'token')
  String? token;

  ResetPasswordResponse({this.message, this.token, });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  static List<ResetPasswordResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(ResetPasswordResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}

