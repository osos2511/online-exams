import 'User.dart';

class ProfileResponse {
  String? message;
  User? user;
  int? code;
  ProfileResponse({
      this.message,
      this.user,
    this.code,
  });

  ProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    code = json['code'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}