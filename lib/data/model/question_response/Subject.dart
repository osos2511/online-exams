class Subject {
  String? id;
  String? name;
  String? icon;
  String? createdAt;
  Subject({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  Subject.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

}