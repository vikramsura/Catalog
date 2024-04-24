class FilterOptionModel {
  bool? success;
  int? status;
  String? message;
  FilterOptionModelData? data;

  FilterOptionModel({this.success, this.status, this.message, this.data});

  FilterOptionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? FilterOptionModelData.fromJson(json['data'])
        : null;
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

class FilterOptionModelData {
  List<int>? matel;
  List<String>? metalType;
  List<String>? metalColor;
  int? metalPrice;
  List<String>? stoneGroup;
  List<String>? stoneName;
  List<String>? stoneShape;
  List<String>? stoneQuality;
  int? stonePrice;

  FilterOptionModelData(
      {this.matel,
      this.metalType,
      this.metalColor,
      this.metalPrice,
      this.stoneGroup,
      this.stoneName,
      this.stoneShape,
      this.stoneQuality,
      this.stonePrice});

  FilterOptionModelData.fromJson(Map<String, dynamic> json) {
    matel = json['matel'].cast<int>();
    metalType = json['metal_type'].cast<String>();
    metalColor = json['metal_color'].cast<String>();
    metalPrice = json['metal_price'];
    stoneGroup = json['stone_group'].cast<String>();
    stoneName = json['stone_name'].cast<String>();
    stoneShape = json['stone_shape'].cast<String>();
    stoneQuality = json['stone_quality'].cast<String>();
    stonePrice = json['stone_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matel'] = this.matel;
    data['metal_type'] = this.metalType;
    data['metal_color'] = this.metalColor;
    data['metal_price'] = this.metalPrice;
    data['stone_group'] = this.stoneGroup;
    data['stone_name'] = this.stoneName;
    data['stone_shape'] = this.stoneShape;
    data['stone_quality'] = this.stoneQuality;
    data['stone_price'] = this.stonePrice;
    return data;
  }
}
