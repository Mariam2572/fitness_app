import 'User.dart';

/// message : "success"
/// user : {"_id":"6856d472db65200514416f77","firstName":"Ahmed","lastName":"Gamal","email":"gemiahmed2002@gmail.com","gender":"male","age":22,"weight":74,"height":169,"activityLevel":"level3","goal":"Get Fitter","photo":"https://fitness.elevateegy.com/uploads/default-profile.png","createdAt":"2025-06-21T15:49:06.015Z"}

class UserResponse {
  UserResponse({
      this.message, 
      this.user,});

  UserResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}