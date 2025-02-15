class ForgetPasswordResponse {
  String? message;
  String? info;
  int? code;
  String? resetCode;
  String? status;

  ForgetPasswordResponse({
    this.message,
    this.info,
    this.code,
    this.resetCode,
    this.status
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    code = json['code'];
    resetCode = json['resetCode']?.toString(); // ✅ تحويل `resetCode` إلى String لتجنب المشاكل
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    map['code'] = code;
    map['resetCode'] = resetCode;
    map['status'] = status;
    return map;
  }
}
