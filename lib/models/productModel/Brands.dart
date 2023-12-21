class Brands {
  Brands({
      num? id, 
      String? brandName, 
      dynamic brandFacebookPageLink, 
      dynamic brandInstagramPageLink, 
      dynamic brandWebsiteLink, 
      String? brandMobileNumber, 
      String? brandEmailAddress, 
      dynamic taxIdNumber, 
      String? brandDescription, 
      String? brandLogoImagePath, 
      num? brandStatusId, 
      dynamic brandStoreAddressId, 
      num? brandCategoryId, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      num? brandSellerId, 
      dynamic brandId, 
      dynamic slashContractPath, 
      num? brandRating, 
      num? daysLimitToReturn, 
      dynamic planId,}){
    _id = id;
    _brandName = brandName;
    _brandFacebookPageLink = brandFacebookPageLink;
    _brandInstagramPageLink = brandInstagramPageLink;
    _brandWebsiteLink = brandWebsiteLink;
    _brandMobileNumber = brandMobileNumber;
    _brandEmailAddress = brandEmailAddress;
    _taxIdNumber = taxIdNumber;
    _brandDescription = brandDescription;
    _brandLogoImagePath = brandLogoImagePath;
    _brandStatusId = brandStatusId;
    _brandStoreAddressId = brandStoreAddressId;
    _brandCategoryId = brandCategoryId;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _brandSellerId = brandSellerId;
    _brandId = brandId;
    _slashContractPath = slashContractPath;
    _brandRating = brandRating;
    _daysLimitToReturn = daysLimitToReturn;
    _planId = planId;
}

  Brands.fromJson(dynamic json) {
    _id = json['id'];
    _brandName = json['brand_name'];
    _brandFacebookPageLink = json['brand_facebook_page_link'];
    _brandInstagramPageLink = json['brand_instagram_page_link'];
    _brandWebsiteLink = json['brand_website_link'];
    _brandMobileNumber = json['brand_mobile_number'];
    _brandEmailAddress = json['brand_email_address'];
    _taxIdNumber = json['tax_id_number'];
    _brandDescription = json['brand_description'];
    _brandLogoImagePath = json['brand_logo_image_path'];
    _brandStatusId = json['brand_status_id'];
    _brandStoreAddressId = json['brand_store_address_id'];
    _brandCategoryId = json['brand_category_id'];
    _deletedAt = json['deletedAt'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _brandSellerId = json['brand_seller_id'];
    _brandId = json['brand_id'];
    _slashContractPath = json['slash_contract_path'];
    _brandRating = json['brand_rating'];
    _daysLimitToReturn = json['days_limit_to_return'];
    _planId = json['planId'];
  }
  num? _id;
  String? _brandName;
  dynamic _brandFacebookPageLink;
  dynamic _brandInstagramPageLink;
  dynamic _brandWebsiteLink;
  String? _brandMobileNumber;
  String? _brandEmailAddress;
  dynamic _taxIdNumber;
  String? _brandDescription;
  String? _brandLogoImagePath;
  num? _brandStatusId;
  dynamic _brandStoreAddressId;
  num? _brandCategoryId;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  num? _brandSellerId;
  dynamic _brandId;
  dynamic _slashContractPath;
  num? _brandRating;
  num? _daysLimitToReturn;
  dynamic _planId;

  num? get id => _id;
  String? get brandName => _brandName;
  dynamic get brandFacebookPageLink => _brandFacebookPageLink;
  dynamic get brandInstagramPageLink => _brandInstagramPageLink;
  dynamic get brandWebsiteLink => _brandWebsiteLink;
  String? get brandMobileNumber => _brandMobileNumber;
  String? get brandEmailAddress => _brandEmailAddress;
  dynamic get taxIdNumber => _taxIdNumber;
  String? get brandDescription => _brandDescription;
  String? get brandLogoImagePath => _brandLogoImagePath;
  num? get brandStatusId => _brandStatusId;
  dynamic get brandStoreAddressId => _brandStoreAddressId;
  num? get brandCategoryId => _brandCategoryId;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get brandSellerId => _brandSellerId;
  dynamic get brandId => _brandId;
  dynamic get slashContractPath => _slashContractPath;
  num? get brandRating => _brandRating;
  num? get daysLimitToReturn => _daysLimitToReturn;
  dynamic get planId => _planId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brand_name'] = _brandName;
    map['brand_facebook_page_link'] = _brandFacebookPageLink;
    map['brand_instagram_page_link'] = _brandInstagramPageLink;
    map['brand_website_link'] = _brandWebsiteLink;
    map['brand_mobile_number'] = _brandMobileNumber;
    map['brand_email_address'] = _brandEmailAddress;
    map['tax_id_number'] = _taxIdNumber;
    map['brand_description'] = _brandDescription;
    map['brand_logo_image_path'] = _brandLogoImagePath;
    map['brand_status_id'] = _brandStatusId;
    map['brand_store_address_id'] = _brandStoreAddressId;
    map['brand_category_id'] = _brandCategoryId;
    map['deletedAt'] = _deletedAt;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['brand_seller_id'] = _brandSellerId;
    map['brand_id'] = _brandId;
    map['slash_contract_path'] = _slashContractPath;
    map['brand_rating'] = _brandRating;
    map['days_limit_to_return'] = _daysLimitToReturn;
    map['planId'] = _planId;
    return map;
  }

}