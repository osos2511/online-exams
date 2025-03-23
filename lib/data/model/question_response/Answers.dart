class Answers {
  String? answer;
  String? key;
  Answers({
      this.answer, 
      this.key,});

  Answers.fromJson(dynamic json) {
    answer = json['answer'];
    key = json['key'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['key'] = key;
    return map;
  }

}