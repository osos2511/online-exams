class Pagination {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  Pagination({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  Pagination.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}