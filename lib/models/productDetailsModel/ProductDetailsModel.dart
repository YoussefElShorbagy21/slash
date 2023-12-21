import 'Data.dart';

class ProductDetailsModel {
  ProductDetailsModel({
      Data? data, 
      String? message, 
      num? statusCode,}){
    _data = data;
    _message = message;
    _statusCode = statusCode;
}

  ProductDetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _statusCode = json['statusCode'];
  }
  Data? _data;
  String? _message;
  num? _statusCode;

  Data? get data => _data;
  String? get message => _message;
  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    return map;
  }

}