import 'Pagination.dart';
import 'Subject.dart';

class SubjectsResponse {
  String? message;
  int? code;
  Pagination? metadata;
  List<Subject>? subjects;
  String? token;

  SubjectsResponse({
      this.message, 
      this.metadata,
    this.code,
      this.subjects,
    this.token,
  });

  SubjectsResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    code = json['code'];
    metadata = json['metadata'] != null ? Pagination.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subject.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['token'] = token;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}