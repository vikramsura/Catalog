class ProductsModel {
  bool? success;
  int? status;
  String? message;
  List<ProductsModelData>? data;

  ProductsModel({this.success, this.status, this.message, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductsModelData>[];
      json['data'].forEach((v) {
        data!.add(ProductsModelData.fromJson(v));
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

class ProductsModelData {
  String? name;
  String? productsUniId;
  int? productPrice;
  String? image;
  List<ProductImage>? productImage;

  ProductsModelData(
      {this.name,
      this.productsUniId,
      this.productPrice,
      this.image,
      this.productImage});

  ProductsModelData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productsUniId = json['products_uni_id'];
    productPrice = json['product_price'];
    image = json['image'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['products_uni_id'] = this.productsUniId;
    data['product_price'] = this.productPrice;
    data['image'] = this.image;
    if (this.productImage != null) {
      data['product_image'] =
          this.productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImage {
  int? id;
  String? sellerUniId;
  String? productsUniId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductImage(
      {this.id,
      this.sellerUniId,
      this.productsUniId,
      this.image,
      this.createdAt,
      this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerUniId = json['seller_uni_id'];
    productsUniId = json['products_uni_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_uni_id'] = this.sellerUniId;
    data['products_uni_id'] = this.productsUniId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
