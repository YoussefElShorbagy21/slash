class ProductPropertiesValues {
  ProductPropertiesValues({
      String? value, 
      String? property,}){
    _value = value;
    _property = property;
}

  ProductPropertiesValues.fromJson(dynamic json) {
    _value = json['value'];
    _property = json['property'];
  }
  String? _value;
  String? _property;

  String? get value => _value;
  String? get property => _property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['property'] = _property;
    return map;
  }

}