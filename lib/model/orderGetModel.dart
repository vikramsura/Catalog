class OrderGetModel {
  bool? success;
  int? status;
  String? message;
  List<OrderGetModelData>? data;

  OrderGetModel({this.success, this.status, this.message, this.data});

  OrderGetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderGetModelData>[];
      json['data'].forEach((v) {
        data!.add(OrderGetModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderGetModelData {
  String? orderId;
  String? userId;
  int? amount;
  int? status;
  var reason;
  String? items;

  OrderGetModelData(
      {this.orderId,
      this.userId,
      this.amount,
      this.status,
      this.reason,
      this.items});

  OrderGetModelData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    amount = json['amount'];
    status = json['status'];
    reason = json['reason'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['items'] = this.items;
    return data;
  }
}
