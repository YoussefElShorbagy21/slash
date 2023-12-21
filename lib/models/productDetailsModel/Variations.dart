import 'ProductVarientImages.dart';
import 'ProductPropertiesValues.dart';

class Variations {
  Variations({
      num? id, 
      num? price, 
      num? quantity, 
      bool? inStock, 
      List<ProductVarientImages>? productVarientImages, 
      List<ProductPropertiesValues>? productPropertiesValues, 
      String? productStatus, 
      bool? isDefault, 
      num? productVariationStatusId,}){
    _id = id;
    _price = price;
    _quantity = quantity;
    _inStock = inStock;
    _productVarientImages = productVarientImages;
    _productPropertiesValues = productPropertiesValues;
    _productStatus = productStatus;
    _isDefault = isDefault;
    _productVariationStatusId = productVariationStatusId;
}

  Variations.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      _productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        _productVarientImages?.add(ProductVarientImages.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      _productPropertiesValues = [];
      json['productPropertiesValues'].forEach((v) {
        _productPropertiesValues?.add(ProductPropertiesValues.fromJson(v));
      });
    }
    _productStatus = json['productStatus'];
    _isDefault = json['isDefault'];
    _productVariationStatusId = json['product_variation_status_id'];
  }
  num? _id;
  num? _price;
  num? _quantity;
  bool? _inStock;
  List<ProductVarientImages>? _productVarientImages;
  List<ProductPropertiesValues>? _productPropertiesValues;
  String? _productStatus;
  bool? _isDefault;
  num? _productVariationStatusId;

  num? get id => _id;
  num? get price => _price;
  num? get quantity => _quantity;
  bool? get inStock => _inStock;
  List<ProductVarientImages>? get productVarientImages => _productVarientImages;
  List<ProductPropertiesValues>? get productPropertiesValues => _productPropertiesValues;
  String? get productStatus => _productStatus;
  bool? get isDefault => _isDefault;
  num? get productVariationStatusId => _productVariationStatusId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['inStock'] = _inStock;
    if (_productVarientImages != null) {
      map['ProductVarientImages'] = _productVarientImages?.map((v) => v.toJson()).toList();
    }
    if (_productPropertiesValues != null) {
      map['productPropertiesValues'] = _productPropertiesValues?.map((v) => v.toJson()).toList();
    }
    map['productStatus'] = _productStatus;
    map['isDefault'] = _isDefault;
    map['product_variation_status_id'] = _productVariationStatusId;
    return map;
  }

}