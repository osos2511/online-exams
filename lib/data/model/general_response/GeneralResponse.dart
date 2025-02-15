import 'User.dart';

class GeneralResponse {
  String? message;
  String? token;
  User? user;
  int? code;
  GeneralResponse({
      this.message, 
      this.token, 
      this.user,
  this.code,
  });

  GeneralResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    code=json['code'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['code']=code;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}