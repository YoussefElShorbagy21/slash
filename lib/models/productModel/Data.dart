import 'Brands.dart';
import 'ProductVariations.dart';
import 'SubCategories.dart';

class Data {
  Data({
      num? id, 
      String? name, 
      String? description, 
      num? subCategoryId, 
      num? brandId, 
      num? bostaSizeId, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      num? productRating, 
      num? estimatedDaysPreparing, 
      Brands? brands, 
      List<ProductVariations>? productVariations, 
      SubCategories? subCategories, 
      dynamic sizeChart,}){
    _id = id;
    _name = name;
    _description = description;
    _subCategoryId = subCategoryId;
    _brandId = brandId;
    _bostaSizeId = bostaSizeId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _productRating = productRating;
    _estimatedDaysPreparing = estimatedDaysPreparing;
    _brands = brands;
    _productVariations = productVariations;
    _subCategories = subCategories;
    _sizeChart = sizeChart;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _subCategoryId = json['sub_category_id'];
    _brandId = json['brand_id'];
    _bostaSizeId = json['bosta_size_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _productRating = json['product_rating'];
    _estimatedDaysPreparing = json['estimated_days_preparing'];
    _brands = json['Brands'] != null ? Brands.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      _productVariations = [];
      json['ProductVariations'].forEach((v) {
        _productVariations?.add(ProductVariations.fromJson(v));
      });
    }
    _subCategories = json['SubCategories'] != null ? SubCategories.fromJson(json['SubCategories']) : null;
    _sizeChart = json['SizeChart'];
  }
  num? _id;
  String? _name;
  String? _description;
  num? _subCategoryId;
  num? _brandId;
  num? _bostaSizeId;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  num? _productRating;
  num? _estimatedDaysPreparing;
  Brands? _brands;
  List<ProductVariations>? _productVariations;
  SubCategories? _subCategories;
  dynamic _sizeChart;

  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  num? get subCategoryId => _subCategoryId;
  num? get brandId => _brandId;
  num? get bostaSizeId => _bostaSizeId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  num? get productRating => _productRating;
  num? get estimatedDaysPreparing => _estimatedDaysPreparing;
  Brands? get brands => _brands;
  List<ProductVariations>? get productVariations => _productVariations;
  SubCategories? get subCategories => _subCategories;
  dynamic get sizeChart => _sizeChart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['sub_category_id'] = _subCategoryId;
    map['brand_id'] = _brandId;
    map['bosta_size_id'] = _bostaSizeId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['product_rating'] = _productRating;
    map['estimated_days_preparing'] = _estimatedDaysPreparing;
    if (_brands != null) {
      map['Brands'] = _brands?.toJson();
    }
    if (_productVariations != null) {
      map['ProductVariations'] = _productVariations?.map((v) => v.toJson()).toList();
    }
    if (_subCategories != null) {
      map['SubCategories'] = _subCategories?.toJson();
    }
    map['SizeChart'] = _sizeChart;
    return map;
  }

}