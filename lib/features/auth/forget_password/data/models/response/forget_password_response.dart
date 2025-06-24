import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'info')
  String? info;

  ForgetPasswordResponse({this.message, this.info, });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  static List<ForgetPasswordResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(ForgetPasswordResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}

