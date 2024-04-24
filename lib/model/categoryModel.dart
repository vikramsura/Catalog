class CategoryModel {
  bool? success;
  int? status;
  String? message;
  List<CategoryModelData>? data;

  CategoryModel({this.success, this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryModelData>[];
      json['data'].forEach((v) {
        data!.add(CategoryModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModelData {
  int? id;
  var userUniId;
  String? name;
  String? uniqueId;
  String? image;
  String? status;
  var isMainCategory;
  var isCategory;
  var isSubCategory;
  var parentId;
  var moq;
  String? createdAt;
  String? updatedAt;

  CategoryModelData(
      {this.id,
      this.userUniId,
      this.name,
      this.uniqueId,
      this.image,
      this.status,
      this.isMainCategory,
      this.isCategory,
      this.isSubCategory,
      this.parentId,
      this.moq,
      this.createdAt,
      this.updatedAt});

  CategoryModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userUniId = json['user_uni_id'];
    name = json['name'];
    uniqueId = json['unique_id'];
    image = json['image'];
    status = json['status'];
    isMainCategory = json['is_main_category'];
    isCategory = json['is_category'];
    isSubCategory = json['is_sub_category'];
    parentId = json['parent_id'];
    moq = json['moq'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_uni_id'] = this.userUniId;
    data['name'] = this.name;
    data['unique_id'] = this.uniqueId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['is_main_category'] = this.isMainCategory;
    data['is_category'] = this.isCategory;
    data['is_sub_category'] = this.isSubCategory;
    data['parent_id'] = this.parentId;
    data['moq'] = this.moq;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
