class ForgetPasswordResponse {
  String? message;
  String? info;
  int? code;
  String? resetCode;
  String? status;
  String? token;

  ForgetPasswordResponse({
    this.message,
    this.info,
    this.code,
    this.resetCode,
    this.status,
    this.token
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    code = json['code'];
    resetCode = json['resetCode']?.toString();
    status = json['status'];
    token=json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    map['code'] = code;
    map['resetCode'] = resetCode;
    map['status'] = status;
    map['token']=token;
    return map;
  }
}
