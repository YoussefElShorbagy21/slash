class Values {
  Values({
      String? value, 
      num? id,}){
    _value = value;
    _id = id;
}

  Values.fromJson(dynamic json) {
    _value = json['value'];
    _id = json['id'];
  }
  String? _value;
  num? _id;

  String? get value => _value;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['id'] = _id;
    return map;
  }

}