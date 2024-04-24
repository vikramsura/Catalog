class ProfileModel {
  bool? success;
  int? status;
  String? message;
  ProfileModelData? data;

  ProfileModel({this.success, this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? ProfileModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileModelData {
  int? id;
  String? name;
  String? email;
  String? countryIso;
  String? countryCode;
  String? mobile;
  String? userUniId;
  String? parentUniId;
  String? image;
  var emailVerifiedAt;
  int? role;
  var planId;
  var planCreatedAt;
  var planExpiredAt;
  int? isProfile;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  ProfileModelData(
      {this.id,
      this.name,
      this.email,
      this.countryIso,
      this.countryCode,
      this.mobile,
      this.userUniId,
      this.parentUniId,
      this.image,
      this.emailVerifiedAt,
      this.role,
      this.planId,
      this.planCreatedAt,
      this.planExpiredAt,
      this.isProfile,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.profile});

  ProfileModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    countryIso = json['country_iso'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    userUniId = json['user_uni_id'];
    parentUniId = json['parent_uni_id'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    planId = json['plan_id'];
    planCreatedAt = json['plan_created_at'];
    planExpiredAt = json['plan_expired_at'];
    isProfile = json['is_profile'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country_iso'] = this.countryIso;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['user_uni_id'] = this.userUniId;
    data['parent_uni_id'] = this.parentUniId;
    data['image'] = this.image;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['plan_id'] = this.planId;
    data['plan_created_at'] = this.planCreatedAt;
    data['plan_expired_at'] = this.planExpiredAt;
    data['is_profile'] = this.isProfile;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? userUniId;
  String? altCountryIso;
  String? altCountryCode;
  String? alternatePhone;
  String? busnessName;
  String? busnessAddress;
  var gstNumber;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.userUniId,
      this.altCountryIso,
      this.altCountryCode,
      this.alternatePhone,
      this.busnessName,
      this.busnessAddress,
      this.gstNumber,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userUniId = json['user_uni_id'];
    altCountryIso = json['alt_country_iso'];
    altCountryCode = json['alt_country_code'];
    alternatePhone = json['alternate_phone'];
    busnessName = json['busness_name'];
    busnessAddress = json['busness_address'];
    gstNumber = json['gst_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_uni_id'] = this.userUniId;
    data['alt_country_iso'] = this.altCountryIso;
    data['alt_country_code'] = this.altCountryCode;
    data['alternate_phone'] = this.alternatePhone;
    data['busness_name'] = this.busnessName;
    data['busness_address'] = this.busnessAddress;
    data['gst_number'] = this.gstNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
