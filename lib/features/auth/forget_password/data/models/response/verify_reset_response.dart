import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_response.g.dart';

@JsonSerializable()
class VerifyResetResponse {
  @JsonKey(name: 'status')
  String? status;

  VerifyResetResponse({this.status});

  factory VerifyResetResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetResponseFromJson(json);

  static List<VerifyResetResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(VerifyResetResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$VerifyResetResponseToJson(this);
}
