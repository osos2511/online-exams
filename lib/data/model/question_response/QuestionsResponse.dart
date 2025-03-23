import 'Questions.dart';

class QuestionsResponse {
  String? message;
  List<Questions>? questions;
  int? code;
  String? token;
  QuestionsResponse({
      this.message, 
      this.questions,
    this.code,
    this.token,
  });

  QuestionsResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    code = json['code'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}