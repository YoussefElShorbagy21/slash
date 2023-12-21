class SubCategories {
  SubCategories({
      num? id, 
      String? name, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      num? categoryId, 
      String? imagePath,}){
    _id = id;
    _name = name;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _categoryId = categoryId;
    _imagePath = imagePath;
}

  SubCategories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _deletedAt = json['deletedAt'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _categoryId = json['category_id'];
    _imagePath = json['image_path'];
  }
  num? _id;
  String? _name;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  num? _categoryId;
  String? _imagePath;

  num? get id => _id;
  String? get name => _name;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get categoryId => _categoryId;
  String? get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['deletedAt'] = _deletedAt;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['category_id'] = _categoryId;
    map['image_path'] = _imagePath;
    return map;
  }

}