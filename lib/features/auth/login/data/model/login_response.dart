/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2ODE2MjEwMTE0MzNhNjY2YzhkOTRlYWEiLCJpYXQiOjE3NDYyODA3MTN9.2RI9NJEz4R8Cr665lFnNWAgL_Cf7LJKARkDS5FnAtww"
library;

class LoginResponse {
  LoginResponse({required this.message, required this.token});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  late String message;
  late String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
