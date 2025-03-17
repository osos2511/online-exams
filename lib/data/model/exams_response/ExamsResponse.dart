import 'Pagination.dart';
import 'Exam.dart';

class ExamsResponse {
  String? message;
  Pagination? metadata;
  List<Exam>? exams;
  int? code;
  String? token;

  ExamsResponse({
      this.message, 
      this.metadata, 
      this.exams,
    this.code,
    this.token,

  });

  ExamsResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    code = json['code'];
    metadata = json['metadata'] != null ? Pagination.fromJson(json['metadata']) : null;
    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(Exam.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (exams != null) {
      map['exams'] = exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}