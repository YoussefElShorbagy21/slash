class Pagination {
  Pagination({
      dynamic pages,}){
    _pages = pages;
}

  Pagination.fromJson(dynamic json) {
    _pages = json['pages'];
  }
  dynamic _pages;

  dynamic get pages => _pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pages'] = _pages;
    return map;
  }

}