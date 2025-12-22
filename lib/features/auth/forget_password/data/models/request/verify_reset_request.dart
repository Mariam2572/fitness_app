import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_request.g.dart';

@JsonSerializable()
class VerifyResetRequest {
  @JsonKey(name: 'resetCode')
  String? resetCode;

  VerifyResetRequest({this.resetCode});

  factory VerifyResetRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetRequestFromJson(json);

  static List<VerifyResetRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map(VerifyResetRequest.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$VerifyResetRequestToJson(this);
}
