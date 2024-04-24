class CreateModel {
  bool? success;
  int? status;
  String? message;
  CreateModelData? data;

  CreateModel({this.success, this.status, this.message, this.data});

  CreateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CreateModelData.fromJson(json['data']) : null;
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

class CreateModelData {
  String? sellerId;
  String? buyerId;
  int? amount;
  String? orderId;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? item;
  String? message;

  CreateModelData(
      {this.sellerId,
      this.buyerId,
      this.amount,
      this.orderId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.item,
      this.message});

  CreateModelData.fromJson(Map<String, dynamic> json) {
    sellerId = json['seller_id'];
    buyerId = json['buyer_id'];
    amount = json['amount'];
    orderId = json['order_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    item = json['item'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_id'] = this.sellerId;
    data['buyer_id'] = this.buyerId;
    data['amount'] = this.amount;
    data['order_id'] = this.orderId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['item'] = this.item;
    data['message'] = this.message;
    return data;
  }
}
