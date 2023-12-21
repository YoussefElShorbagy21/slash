import 'ProductStatusLookups.dart';
import 'ProductVarientImages.dart';

class ProductVariations {
  ProductVariations({
      num? id, 
      num? productId, 
      num? price, 
      num? quantity, 
      bool? isDefault, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      num? productVariationStatusId, 
      ProductStatusLookups? productStatusLookups, 
      List<ProductVarientImages>? productVarientImages,}){
    _id = id;
    _productId = productId;
    _price = price;
    _quantity = quantity;
    _isDefault = isDefault;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productVariationStatusId = productVariationStatusId;
    _productStatusLookups = productStatusLookups;
    _productVarientImages = productVarientImages;
}

  ProductVariations.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _isDefault = json['is_default'];
    _deletedAt = json['deletedAt'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _productVariationStatusId = json['product_variation_status_id'];
    _productStatusLookups = json['ProductStatusLookups'] != null ? ProductStatusLookups.fromJson(json['ProductStatusLookups']) : null;
    if (json['ProductVarientImages'] != null) {
      _productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        _productVarientImages?.add(ProductVarientImages.fromJson(v));
      });
    }
  }
  num? _id;
  num? _productId;
  num? _price;
  num? _quantity;
  bool? _isDefault;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  num? _productVariationStatusId;
  ProductStatusLookups? _productStatusLookups;
  List<ProductVarientImages>? _productVarientImages;

  num? get id => _id;
  num? get productId => _productId;
  num? get price => _price;
  num? get quantity => _quantity;
  bool? get isDefault => _isDefault;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get productVariationStatusId => _productVariationStatusId;
  ProductStatusLookups? get productStatusLookups => _productStatusLookups;
  List<ProductVarientImages>? get productVarientImages => _productVarientImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['is_default'] = _isDefault;
    map['deletedAt'] = _deletedAt;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['product_variation_status_id'] = _productVariationStatusId;
    if (_productStatusLookups != null) {
      map['ProductStatusLookups'] = _productStatusLookups?.toJson();
    }
    if (_productVarientImages != null) {
      map['ProductVarientImages'] = _productVarientImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}