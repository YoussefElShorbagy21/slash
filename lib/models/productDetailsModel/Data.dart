import 'SubCategory.dart';
import 'Variations.dart';
import 'AvaiableProperties.dart';

class Data {
  Data({
      num? id, 
      String? name, 
      String? description, 
      num? brandId, 
      num? bostaSizeId, 
      num? productRating, 
      num? estimatedDaysPreparing, 
      dynamic sizeChart, 
      SubCategory? subCategory, 
      List<Variations>? variations, 
      List<AvaiableProperties>? avaiableProperties, 
      String? brandName, 
      String? brandImage,}){
    _id = id;
    _name = name;
    _description = description;
    _brandId = brandId;
    _bostaSizeId = bostaSizeId;
    _productRating = productRating;
    _estimatedDaysPreparing = estimatedDaysPreparing;
    _sizeChart = sizeChart;
    _subCategory = subCategory;
    _variations = variations;
    _avaiableProperties = avaiableProperties;
    _brandName = brandName;
    _brandImage = brandImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _brandId = json['brand_id'];
    _bostaSizeId = json['bosta_size_id'];
    _productRating = json['product_rating'];
    _estimatedDaysPreparing = json['estimated_days_preparing'];
    _sizeChart = json['SizeChart'];
    _subCategory = json['subCategory'] != null ? SubCategory.fromJson(json['subCategory']) : null;
    if (json['variations'] != null) {
      _variations = [];
      json['variations'].forEach((v) {
        _variations?.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      _avaiableProperties = [];
      json['avaiableProperties'].forEach((v) {
        _avaiableProperties?.add(AvaiableProperties.fromJson(v));
      });
    }
    _brandName = json['brandName'];
    _brandImage = json['brandImage'];
  }
  num? _id;
  String? _name;
  String? _description;
  num? _brandId;
  num? _bostaSizeId;
  num? _productRating;
  num? _estimatedDaysPreparing;
  dynamic _sizeChart;
  SubCategory? _subCategory;
  List<Variations>? _variations;
  List<AvaiableProperties>? _avaiableProperties;
  String? _brandName;
  String? _brandImage;

  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  num? get brandId => _brandId;
  num? get bostaSizeId => _bostaSizeId;
  num? get productRating => _productRating;
  num? get estimatedDaysPreparing => _estimatedDaysPreparing;
  dynamic get sizeChart => _sizeChart;
  SubCategory? get subCategory => _subCategory;
  List<Variations>? get variations => _variations;
  List<AvaiableProperties>? get avaiableProperties => _avaiableProperties;
  String? get brandName => _brandName;
  String? get brandImage => _brandImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['brand_id'] = _brandId;
    map['bosta_size_id'] = _bostaSizeId;
    map['product_rating'] = _productRating;
    map['estimated_days_preparing'] = _estimatedDaysPreparing;
    map['SizeChart'] = _sizeChart;
    if (_subCategory != null) {
      map['subCategory'] = _subCategory?.toJson();
    }
    if (_variations != null) {
      map['variations'] = _variations?.map((v) => v.toJson()).toList();
    }
    if (_avaiableProperties != null) {
      map['avaiableProperties'] = _avaiableProperties?.map((v) => v.toJson()).toList();
    }
    map['brandName'] = _brandName;
    map['brandImage'] = _brandImage;
    return map;
  }

}