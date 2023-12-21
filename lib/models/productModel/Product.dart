

import 'Data.dart';
import 'Pagination.dart';

class Product {
  Product({
      num? statusCode, 
      String? message, 
      Pagination? pagination, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _pagination = pagination;
    _data = data;
}

  Product.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _statusCode;
  String? _message;
  Pagination? _pagination;
  List<Data>? _data;

  num? get statusCode => _statusCode;
  String? get message => _message;
  Pagination? get pagination => _pagination;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}