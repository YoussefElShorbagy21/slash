import 'Values.dart';

class AvaiableProperties {
  AvaiableProperties({
      String? property, 
      List<Values>? values,}){
    _property = property;
    _values = values;
}

  AvaiableProperties.fromJson(dynamic json) {
    _property = json['property'];
    if (json['values'] != null) {
      _values = [];
      json['values'].forEach((v) {
        _values?.add(Values.fromJson(v));
      });
    }
  }
  String? _property;
  List<Values>? _values;

  String? get property => _property;
  List<Values>? get values => _values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property'] = _property;
    if (_values != null) {
      map['values'] = _values?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}