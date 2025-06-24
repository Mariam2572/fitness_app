import 'package:json_annotation/json_annotation.dart';
part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequest {

  @JsonKey(name: 'email')
  String? email;


  ForgetPasswordRequest({
    this.email,
  });

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);

  static List<ForgetPasswordRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map(ForgetPasswordRequest.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
