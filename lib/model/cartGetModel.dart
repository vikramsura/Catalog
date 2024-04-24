class CartGetModel {
  bool? success;
  int? status;
  String? message;
  CartGetModelData? data;

  CartGetModel({this.success, this.status, this.message, this.data});

  CartGetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? CartGetModelData.fromJson(json['data']) : null;
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

class CartGetModelData {
  List<Cart>? cart;
  List<Similar>? similar;
  int? orderAmount;

  CartGetModelData({this.cart, this.similar, this.orderAmount});

  CartGetModelData.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
    if (json['similar'] != null) {
      similar = <Similar>[];
      json['similar'].forEach((v) {
        similar!.add(new Similar.fromJson(v));
      });
    }
    orderAmount = json['order_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    if (this.similar != null) {
      data['similar'] = this.similar!.map((v) => v.toJson()).toList();
    }
    data['order_amount'] = this.orderAmount;
    return data;
  }
}

class Cart {
  int? id;
  int? moq;
  int? quantity;
  int? price;
  String? productId;
  int? totalAmount;
  String? productName;
  int? metalPrice;
  int? productPrice;
  String? image;
  ProductsingleImage? productsingleImage;

  Cart(
      {this.id,
      this.moq,
      this.quantity,
      this.price,
      this.productId,
      this.totalAmount,
      this.productName,
      this.metalPrice,
      this.productPrice,
      this.image,
      this.productsingleImage});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moq = json['moq'];
    quantity = json['quantity'];
    price = json['price'];
    productId = json['product_id'];
    totalAmount = json['total_amount'];
    productName = json['product_name'];
    metalPrice = json['metal_price'];
    productPrice = json['product_price'];
    image = json['image'];
    productsingleImage = json['productsingle_image'] != null
        ? new ProductsingleImage.fromJson(json['productsingle_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['moq'] = this.moq;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['product_id'] = this.productId;
    data['total_amount'] = this.totalAmount;
    data['product_name'] = this.productName;
    data['metal_price'] = this.metalPrice;
    data['product_price'] = this.productPrice;
    data['image'] = this.image;
    if (this.productsingleImage != null) {
      data['productsingle_image'] = this.productsingleImage!.toJson();
    }
    return data;
  }
}

class ProductsingleImage {
  String? image;

  ProductsingleImage({this.image});

  ProductsingleImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class Similar {
  String? name;
  String? productsUniId;
  int? productPrice;
  String? image;
  ProductsingleImage? productsingleImage;

  Similar(
      {this.name,
      this.productsUniId,
      this.productPrice,
      this.image,
      this.productsingleImage});

  Similar.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productsUniId = json['products_uni_id'];
    productPrice = json['product_price'];
    image = json['image'];
    productsingleImage = json['productsingle_image'] != null
        ? new ProductsingleImage.fromJson(json['productsingle_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['products_uni_id'] = this.productsUniId;
    data['product_price'] = this.productPrice;
    data['image'] = this.image;
    if (this.productsingleImage != null) {
      data['productsingle_image'] = this.productsingleImage!.toJson();
    }
    return data;
  }
}
