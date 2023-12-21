class ProductVarientImages {
  ProductVarientImages({
      num? id, 
      String? imagePath, 
      dynamic productVarientId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _imagePath = imagePath;
    _productVarientId = productVarientId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ProductVarientImages.fromJson(dynamic json) {
    _id = json['id'];
    _imagePath = json['image_path'];
    _productVarientId = json['product_varient_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  String? _imagePath;
  dynamic _productVarientId;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get imagePath => _imagePath;
  dynamic get productVarientId => _productVarientId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image_path'] = _imagePath;
    map['product_varient_id'] = _productVarientId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}